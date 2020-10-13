#include <stdio.h>
#include <getopt.h>
#include <limits.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_NUMBER_OF_ELEMENTS 100
#define DECIMAL_NOTATION 10
#define MIN_NUMBER_OF_PARAMETERS 2
#define MAX_NUMBER_OF_PARAMETERS 3

extern int selection_sort(long long *, int);

void parsing_and_checking_parameters(const int *argc, char **argv, long long *from, long long *to) {
    bool first_parameter_is_entered = false, second_parameter_is_entered = false;
    if (*argc < MIN_NUMBER_OF_PARAMETERS)
        exit(-1);
    if (*argc > MAX_NUMBER_OF_PARAMETERS)
        exit(-2);

    const struct option long_options[] = {
            {"from", optional_argument, NULL, 'f'},
            {"to",   optional_argument, NULL, 't'},
            {NULL,   0,                 NULL, 0}
    };
    int option_index;
    opterr = 0; // Disabling getopt() error messages
    int result_of_reading = getopt_long_only(*argc, argv, "", long_options, &option_index);
    while (result_of_reading != -1) {
        switch (result_of_reading) {
            case 'f':
                if (first_parameter_is_entered)
                    exit(-3);
                *from = strtoll((optarg ? optarg : "0"), NULL, DECIMAL_NOTATION);
                first_parameter_is_entered = true;
                break;
            case 't':
                if (second_parameter_is_entered)
                    exit(-3);
                *to = strtoll((optarg ? optarg : "0"), NULL, DECIMAL_NOTATION);
                second_parameter_is_entered = true;
                break;
            case '?':
                break;
            default:
                exit(-4);
        }
        result_of_reading = getopt_long_only(*argc, argv, "", long_options, &option_index);
    }
    if (!first_parameter_is_entered && !second_parameter_is_entered)
        exit(-4);
}

void parsing_the_input_array(long long *input_array, int *input_cardinality) {
    char separator = ' ';
    while (separator == ' ') {
        scanf("%lld%c", &input_array[*input_cardinality], &separator);
        *input_cardinality += 1;
    }
}

int main(int argc, char **argv) {
    long long from = LLONG_MIN, to = LLONG_MAX;
    parsing_and_checking_parameters(&argc, argv, &from, &to);

    long long *input_array = (long long *) malloc(sizeof(long long) * MAX_NUMBER_OF_ELEMENTS);
    int input_cardinality = 0;
    parsing_the_input_array(input_array, &input_cardinality);
    input_array = (long long *) realloc(input_array, sizeof(long long) * input_cardinality);

    int sorted_cardinality = 0;
    for (int i = 0; i < input_cardinality; ++i) {
        if (input_array[i] <= from)
            fprintf(stdout, "%lld ", input_array[i]);
        if (input_array[i] >= to)
            fprintf(stderr, "%lld ", input_array[i]);
        if (input_array[i] > from && input_array[i] < to)
            ++sorted_cardinality;
    }
    long long *sorted_array = (long long *) malloc(sizeof(long long) * sorted_cardinality);

    int counter = 0;
    for (int i = 0; i < input_cardinality; ++i) {
        if (input_array[i] > from && input_array[i] < to) {
            sorted_array[counter] = input_array[i];
            ++counter;
        }
    }

    selection_sort(sorted_array, sorted_cardinality);
    int number_of_permutations = 0;
    counter = 0;
    for (int i = 0; i < input_cardinality; ++i) {
        if (input_array[i] > from && input_array[i] < to) {
            if (input_array[i] != sorted_array[counter])
                ++number_of_permutations;
            ++counter;
        }
    }
    return number_of_permutations;
}