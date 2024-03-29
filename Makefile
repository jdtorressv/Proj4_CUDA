targets = gaussian_blur_serial gaussian_blur_cuda 
components_gaussian_blur_serial := gaussian_blur_serial.o
components_gaussian_blur_cuda := gaussian_blur_cuda.o 

NCC = nvcc 
CC = gcc 
WARN := -Wall -Werror
CWARN := -Xcompiler -Wall -Xcompiler -Werror

OPTIMIZATION := -O2
COPTIMIZATION := -Xcompiler -O2
LIBS := -lm

all: $(targets)

gaussian_blur_serial: $(components_gaussian_blur_serial)
	@echo "LN $@"
	$(CC) $(OPTIMIZATION) $(WARN) -o $@ $^ $(LIBS)

gaussian_blur_cuda: $(components_gaussian_blur_cuda)
	@echo "LN $@"
	$(CC) $(OPTIMIZATION) $(WARN) -o $@ $^ $(LIBS)

%.o: %.c
	@echo "CC $@"
	$(CC) -c $(OPTIMIZATION) $(WARN) -o $@ $< $(LIBS)

clean:
	@echo "clean"
	rm -f $(components_gaussian_blur_serial)
	rm -f $(components_gaussian_blur_cuda) 
	rm -f $(targets)
