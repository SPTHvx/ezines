/* A tool to dump partitions table inside a virtual disk (vdi file) by WarGame/DoomRiderz */

#include <stdio.h>
#include <string.h>

/* from VDICore.h and VBoxHDD-new.h*/

typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;

typedef struct VDIDISKGEOMETRY
{
    /** Cylinders. */
    uint32_t    cCylinders;
    /** Heads. */
    uint32_t    cHeads;
    /** Sectors per track. */
    uint32_t    cSectors;
    /** Sector size. (bytes per sector) */
    uint32_t    cbSector;
} VDIDISKGEOMETRY, *PVDIDISKGEOMETRY;

typedef struct VDIPREHEADER 
{
    /** Just text info about image type, for eyes only. */
    char            szFileInfo[64];
    /** The image signature (VDI_IMAGE_SIGNATURE). */
    uint32_t        u32Signature;
    /** The image version (VDI_IMAGE_VERSION). */
    uint32_t        u32Version;
} VDIPREHEADER, *PVDIPREHEADER;

#define VDI_IMAGE_COMMENT_SIZE    256

typedef struct VDIHEADER1
{
    /** Size of this structure in bytes. */
    uint32_t        cbHeader;
    /** The image type (VDI_IMAGE_TYPE_*). */
    uint32_t        u32Type;
    /** Image flags (VDI_IMAGE_FLAGS_*). */
    uint32_t        fFlags;
    /** Image comment. (UTF-8) */
    char            szComment[VDI_IMAGE_COMMENT_SIZE];
    /** Offset of Blocks array from the begining of image file.
     * Should be sector-aligned for HDD access optimization. */
    uint32_t        offBlocks;
    /** Offset of image data from the begining of image file.
     * Should be sector-aligned for HDD access optimization. */
    uint32_t        offData;
    /** Legacy image geometry (previous code stored PCHS there). */
    VDIDISKGEOMETRY LegacyGeometry;
    /** Was BIOS HDD translation mode, now unused. */
    uint32_t        u32Dummy;
    /** Size of disk (in bytes). */
    uint64_t        cbDisk;
    /** Block size. (For instance VDI_IMAGE_BLOCK_SIZE.) Should be a power of 2! */
    uint32_t        cbBlock;
    /** Size of additional service information of every data block.
     * Prepended before block data. May be 0.
     * Should be a power of 2 and sector-aligned for optimization reasons. */
    uint32_t        cbBlockExtra;
    /** Number of blocks. */
    uint32_t        cBlocks;
    /** Number of allocated blocks. */
    uint32_t        cBlocksAllocated;
    /** UUID of image. */
    char          uuidCreate[16];
    /** UUID of image's last modification. */
    char          uuidModify[16];
    /** Only for secondary images - UUID of previous image. */
    char          uuidLinkage[16];
    /** Only for secondary images - UUID of previous image's last modification. */
    char          uuidParentModify[16];
} VDIHEADER1, *PVDIHEADER1;

/** Get VDI major version from combined version. */
#define VDI_GET_VERSION_MAJOR(uVer)    ((uVer) >> 16)
/** Get VDI minor version from combined version. */
#define VDI_GET_VERSION_MINOR(uVer)    ((uVer) & 0xffff)

typedef struct MBR /* my definition for master boot record */
{
	char boot_code[446];
	unsigned char partitions[4][16];
	unsigned short signature; 
}MBR;

/****************/

void ExtractPartition(char *f,int offdata,int part_num,int start_sect,int size_sect)
{
	FILE *vdi = NULL,*part = NULL;	
	char ex_name[128],buf[512];
	unsigned int size = size_sect*512;

	if((vdi = fopen(f,"r")) == NULL)
	{
		printf("can't open %s\n",f);
		return;
	}
	
	sprintf(ex_name,"partition_%d____%d_%d.raw",part_num,start_sect,size_sect);

	if((part = fopen(ex_name,"a+")) == NULL)
	{
		fclose(vdi);
		printf("can't open %s\n",ex_name);
		return;
	}

	fseek(vdi,offdata,SEEK_SET);
	fseek(vdi,start_sect*512,SEEK_CUR);
	printf("Extracting...\n");
		
	while(size > 0)
	{
		fread(buf,512,1,vdi);
		fwrite(buf,512,1,part);
		size -= 512;
	}

	fclose(vdi);
	fclose(part);

	printf("Extraction done to %s\n",ex_name);
	
}

void DumpVDIPartitionTable(char *f, int extract)
{
	FILE *fp = fopen(f,"r");
	VDIPREHEADER pre;
	VDIHEADER1 h1;
	MBR mbr;
	int offdata = 0,p_cnt,sect_after_mbr,sect_in_partition;

	if(fp == NULL)
	{
		printf("can't open %s\n",f);
	}

	else
	{
		fread(&pre,sizeof(VDIPREHEADER),1,fp);

		if(VDI_GET_VERSION_MAJOR(pre.u32Version) == 1 && VDI_GET_VERSION_MINOR(pre.u32Version) == 1)
		{

			if(h1.u32Type == 1)
			{
				printf("%s is not a fixed size disk\n",f);
			}
		
				else
				{
					fread(&h1,sizeof(VDIHEADER1),1,fp);
					
					if(h1.offData != 0)
					{
						printf("Offdata (%s) -> %d\n",f,h1.offData);
						rewind(fp);
						fseek(fp,h1.offData,SEEK_SET);	
						fread(&mbr,sizeof(MBR),1,fp);
						fclose(fp);
						printf("MBR signature -> 0x%x\n",mbr.signature);
						for(p_cnt = 0;p_cnt < 4;p_cnt++)
						{
							memcpy(&sect_after_mbr,mbr.partitions[p_cnt]+8,4);
							memcpy(&sect_in_partition,mbr.partitions[p_cnt]+12,4);
							printf("Partition #%d -> status: %10s - type: 0x%.2x - partition begins at sector: %9d - sectors in partition: %9d\n",p_cnt,(mbr.partitions[p_cnt][0] == 0x80) ? "bootable" : "not active",mbr.partitions[p_cnt][4],sect_after_mbr,sect_in_partition);
							if(extract)
								ExtractPartition(f,h1.offData,p_cnt,sect_after_mbr,sect_in_partition);
						}
					}
	
					else
					{
						printf("header and offdata unknown in %s\n",f);
					}
				}
		} 

		else
		{
			printf("Header not supported in %s\n",f);
		}
	
	}
}

int main(int argc,char *argv[])
{
	int a_cnt,extract;

	if(argc == 1)
	{
		printf("Dump partitions table from VDI (virtual disk) files by WarGame/DoomRiderz\n");
		printf("Usage: [-d | -e] <vdi file 1> <vdi file 2> ... <vdi file n> \n",argv[0]);
		printf("Options:\n");
		printf("-d only print the partitions table on stdout\n");
		printf("-e print the partitions table on stdout and extract the partitions one by one and write them on files\n");
		return 1;
	}

	else
	{
		if(strcmp(argv[1],"-d") == 0)
		{
			extract = 0;
		}

		else if(strcmp(argv[1],"-e") == 0)
		{
			extract = 1;
		}

		else
		{
			printf("Invalid option\n");
			return 1;
		}
		
		for(a_cnt = 2;a_cnt < argc;a_cnt++)
			DumpVDIPartitionTable(argv[a_cnt],extract);

		return 0;
	}
}
