all: jewel-2.0.2-vac jewel-2.0.2-simple

# path to LHAPDF library
# LHAPDF_PATH := /home/lhapdf/install/lib/
LHAPDF_PATH := /cvmfs/alice.cern.ch/x86_64-2.6-gnu-4.1.2/Packages/lhapdf5/v5.9.1-5/lib

FC := gfortran
FFLAGS := -g -static

jewel-2.0.2-vac: jewel-2.0.2.o medium-vac.o pythia6425mod.o meix.o
	$(FC) -o $@ -L$(LHAPDF_PATH) $^ -lLHAPDF

jewel-2.0.2-simple: jewel-2.0.2.o medium-simple.o pythia6425mod.o meix.o
	$(FC) -o $@ -L$(LHAPDF_PATH) $^ -lLHAPDF

clean:
	rm -f medium-*.o 
	rm -f jewel*.o
	rm -f pythia6425mod.o meix.o
	rm -f *~

.PHONY: all
