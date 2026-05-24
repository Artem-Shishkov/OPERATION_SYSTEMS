#include <iostream>
#include <fstream>
#include <thread>
#include <mutex>
#include "fibonacci.h"

const int N = 25;
const char* OUTPUT_FILE = "fib_result.txt";

// Общий ресурс: файл + мьютекс для синхронизации
std::mutex mtx;

void writeToFile(long long* arr, int start, int end) {
    std::lock_guard<std::mutex> lock(mtx);  // Захват мьютекса
    std::ofstream out(OUTPUT_FILE, std::ios::app);  // app — дописываем в конец
    for (int i = start; i < end; ++i)
        out << arr[i] << " ";
    out.close();
    // Мьютекс освобождается автоматически при выходе из блока
}

int main() {
    long long* arr = new long long[N];
    fibonacci(N, arr);

    // Очищаем файл перед записью
    std::ofstream clear(OUTPUT_FILE);
    clear.close();

    // Запускаем два параллельных потока
    std::thread t1(writeToFile, arr, 0, N / 2);      // Первая половина
    std::thread t2(writeToFile, arr, N / 2, N);      // Вторая половина

    // Ждём завершения обоих потоков
    t1.join();
    t2.join();

    delete[] arr;

    std::cout << "[Info] Fibonacci numbers written to " << OUTPUT_FILE << std::endl;
    std::cout << "[Info] File contents:" << std::endl;

    // Выводим содержимое файла на экран
    std::ifstream in(OUTPUT_FILE);
    std::string line;
    while (std::getline(in, line))
        std::cout << line << std::endl;
    in.close();

    return 0;
}