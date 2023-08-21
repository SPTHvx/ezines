/* http://www.fpx.de/fp/Software/Sieve.html */
#ifndef	PRIMES_C
#define	PRIMES_C

#define TEST(f,x)	(*(f+(x)/16)&(1<<(((x)%16L)/2)))
#define SET(f,x)	*(f+(x)/16)|=1<<(((x)%16L)/2)

static inline uint8_t *make_primes(int max)
{
	uint8_t *feld;
	int size = (max >> 4) + 1, teste = 1, mom;
	if ((feld = (uint8_t*)malloc(size)) == NULL)
		return NULL;
	bzero(feld, size);
	while ((teste += 2) < max)
		if (! TEST(feld, teste))
			for (mom = 3L * teste; mom < max; mom += teste << 1)
				SET (feld, mom);
	return feld;
}

static inline int is_prime(int n, uint8_t *feld)
{
	if (n % 2 == 0)
		return 0;
	if (!TEST(feld, n))
		return 1;
	return 0;
}

static inline int find_nearest_prime(int n, uint8_t *feld, int max)
{
	int m = n - 2;
	if (n % 2 == 0)
		m++;
	while ((m += 2) < max)
		if (! TEST(feld, m))
			return m;
	return n;
}

#undef	TEST
#undef	SET
#endif	/* PRIMES_C */
