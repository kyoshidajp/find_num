/**
 * compile example)
 * % gcc -shared -fPIC -o find.so find.c
 */

int find(int min, int max, int *array)
{
    int i, j = 0;
    int target_total = 0;
    int original_total = 0;

    for(i = 0; i < (max - 1); i++)
    {
        target_total += array[i];
    }

    for(j = 0; j < max; j++)
    {
        original_total += j + 1;
    }

    return original_total - target_total;
}