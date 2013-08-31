#include <stdio.h>
#include <string.h>

int minimum(int x, int y, int z) {
  int min = x;

  if (y < min)
    min = y;

  if (z < min)
    min = z;

  return min;
}

int levenshtein_distance(char *s1, char *s2)
{
    int m = strlen(s1);
    int n = strlen(s2);
    int comparison_array[m+1][n+1];

    int i = 0;
    int j = 0;
    int cost = 0;

    int insertion_cost;
    int deletion_cost;
    int substitution_cost;

    for (i = 0; i < m+1; i++)
        comparison_array[i][0] = i;

    for (j = 0; j < n+1; j++)
        comparison_array[0][j] = j;

    for (j = 1; j < n+1; j++)
    {
        for (i = 1; i < m+1; i++) 
        {
            if (s1[i-1]  == s2[j-1])
                cost = 0;
            else
                cost = 1;

            insertion_cost = comparison_array[i-1][j] + 1;
            deletion_cost = comparison_array[i][j-1] + 1;
            substitution_cost = comparison_array[i-1][j-1] + cost;

            comparison_array[i][j] = minimum(insertion_cost, deletion_cost, substitution_cost);
        }
    }

    return comparison_array[m][n];
}
