CXX       = g++
CXXFLAGS  = -Wall -std=c++11

TARGET         = fib
PARALLEL_TARGET = fib_parallel

ASM_TARGETS = fibonacci_O0.s fibonacci_O3.s

.PHONY: all asm clean

all: $(TARGET) $(PARALLEL_TARGET)

$(TARGET): main.o fibonacci.o
	$(CXX) $(CXXFLAGS) -o $@ $^

$(PARALLEL_TARGET): fib_parallel.o fibonacci.o
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp fibonacci.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

asm: $(ASM_TARGETS)

fibonacci_O0.s: fibonacci.cpp fibonacci.h
	$(CXX) -S -O0 -o $@ fibonacci.cpp

fibonacci_O3.s: fibonacci.cpp fibonacci.h
	$(CXX) -S -O3 -o $@ fibonacci.cpp

clean:
	rm -f $(TARGET) $(PARALLEL_TARGET) *.o $(ASM_TARGETS) fib_result.txt