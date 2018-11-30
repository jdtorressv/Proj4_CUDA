targets = mmm_mpi mandelbrot_mpi  
components_mmm_mpi := mmm_mpi.o matrix_checksum.o
components_mandelbrot_mpi := mandelbrot_mpi.o matrix_checksum.o

CC = mpicc
WARN := -Wall -Werror
# CFLAGS = -g
OPTIMIZATION := -O2
LIBS := -lm

all: $(targets)

mmm_mpi: $(components_mmm_mpi)
	@echo "LN $@"
	$(CC) $(OPTIMIZATION) $(WARN) -o $@ $^ $(LIBS)

mandelbrot_mpi: $(components_mandelbrot_mpi)
	@echo "LN $@"
	$(CC) $(OPTIMIZATION) $(WARN) -o $@ $^ $(LIBS)

%.o: %.c
	@echo "CC $@"
	$(CC) -c $(OPTIMIZATION) $(WARN) -o $@ $< $(LIBS)

clean:
	@echo "clean"
	rm -f $(components_mmm_mpi)
	rm -f $(components_mandelbrot_mpi) 
	rm -f $(targets)
