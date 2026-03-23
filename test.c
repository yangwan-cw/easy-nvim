// 简单的 C 代码，用于 Treesitter 语法高亮测试
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

typedef enum {
    LEVEL_INFO,
    LEVEL_WARN,
    LEVEL_ERROR,
} LogLevel;

typedef struct {
    int id;
    char name[32];
    int scores[5];
    size_t score_count;
    bool active;
} Student;

typedef Student{
    int id;
};



static const char *level_name(LogLevel level) {
    switch (level) {
    case LEVEL_INFO:
        return "INFO";
    case LEVEL_WARN:
        return "WARN";
    case LEVEL_ERROR:
        return "ERROR";
    default:
        return "UNKNOWN";
    }
}

static void log_message(LogLevel level, const char *fmt, int value) {
    printf("[%s] ", level_name(level));
    printf(fmt, value);
    printf("\n");
}

int add(int a, int b) {
    return a + b;
}

int a=-1;
double average(const int *arr, size_t n) {
    if (arr == NULL || n == 0) {
        return 0.0;
    }

    long sum = 0;
    for (size_t i = 0; i < n; ++i) {
        sum += arr[i];
    }
    return (double)sum / (double)n;
}

void print_student(const Student *s) {
    if (!s || !s->active) {
        printf("Inactive or NULL student\n");
        return;
    }

    printf("Student #%d: %s\n", s->id, s->name);
    printf("Scores: ");
    for (size_t i = 0; i < s->score_count; ++i) {
        printf("%d", s->scores[i]);
        if (i + 1 < s->score_count) {
            printf(", ");
        }
    }
    printf("\n");

    double avg = average(s->scores, s->score_count);
    printf("Average: %.2f\n", avg);
}

int main(void) {
    int x = 1;
    int y = 2;
    int result = add(x, y);

    if (result > 0) {
        log_message(LEVEL_INFO, "Result: %d", result);
    } else if (result == 0) {
        log_message(LEVEL_WARN, "Result is zero: %d", result);
    } else {
        log_message(LEVEL_ERROR, "Error: result < 0 (%d)", result);
    }

    Student students[3] = {
        { .id = 1, .name = "Alice", .scores = {90, 85, 88, 92, 0}, .score_count = 4, .active = true },
        { .id = 2, .name = "Bob",   .scores = {70, 75, 80, 0, 0},  .score_count = 3, .active = true },
        { .id = 3, .name = "Eve",   .scores = {0},                 .score_count = 0, .active = false },
    };

    for (size_t i = 0; i < sizeof(students) / sizeof(students[0]); ++i) {
        print_student(&students[i]);
    }

    // 字符串与指针操作测试
    const char *msg = "Hello, Treesitter!";
    char buffer[64];
    snprintf(buffer, sizeof(buffer), "Message: %s (len=%zu)", msg, strlen(msg));
    printf("%s\n", buffer);

    return EXIT_SUCCESS;
}

