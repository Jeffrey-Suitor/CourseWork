/* Some Fun   */
/* Martin v. M. very old code ...  */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define NUM_ACTIONS 2

char in[20];
int actions[NUM_ACTIONS] = {1 ,2};
enum players {COMPUTER, AI};


int computer2(int current_score);
int evaluate(int local_score);

int user(int current_score) {
    int i = 0;
    while (i != 1 && i != 2) {
        printf("We are at %-2d, add 1 or 2 ? ", current_score);
        fgets(in, 10, stdin);
        i = atoi(in);
    };
    return (i);
}

int evaluate(int local_score) {
    if (local_score == 20 || local_score == 21) {
        return +10;
    } else if (local_score == 18 || local_score == 19) {
        return -10;
    } else {
        return 0;
    }
}

float reward(int temp_score, int depth, int turn) {
    int eval = evaluate(temp_score);
    if (eval != 0) {
        return eval;
    }

    float tmp, max;
    float gamma = pow (0.5, depth);

    if (turn == COMPUTER) { // If it is the computers turn
        temp_score += computer2(temp_score);
        max = reward(temp_score, depth + 1, AI);
    } else {
        max = -1000000;
        for (int i = 0; i < NUM_ACTIONS; i++) {
            tmp = reward(temp_score + actions[i], depth + 1, COMPUTER);
            if (tmp < max) {
                max = tmp;
            }
        }
    }
    return (gamma * max);
}

int ai(int current_score) {
    int best_action = 0;
    float best_action_score = -100000000;
    float current_action_score = -100000000;

    for (int i = 0; i < NUM_ACTIONS; i++) {
        current_action_score = reward(current_score + actions[i], 0, COMPUTER);
        printf("Current action %f Max action %f\n", current_action_score, best_action_score);
        if (current_action_score > best_action_score) {
            best_action_score = current_action_score;
            best_action = actions[i];
        }
    }
    printf("Score %d Best Action %d \n", current_score, best_action);

    return best_action;
}

int computer2(int current_score) {
    int val = 0;
    if (current_score % 3 == 1)
        val = 1;
    else if (current_score % 3 == 0)
        val = 2;
    else
        val = rand() % 2 + 1;
    return (val);
}

int main(void) {
    srand(time(NULL));
    printf(" Who says first 20 \n \n");
    int score = 0;
    int val = 0;
    if (rand() % 2 == COMPUTER) { // Let the computer go first
        val = computer2(score);
        score += val;
        printf("Computer played %d New Score %d\n", val, score);
    }
    while (score <= 20) {
        val = ai(score);
        score += val;
        printf("AI played %d New Score %d\n", val, score);
        if (score >= 20) {
            printf(" AI WIN !!\n ");
            break;
        };
        val = computer2(score);
        /* val = user(score); */
        score += val;
        printf("Computer played %d New Score %d\n", val, score);
        if (score >= 20) {
            printf(" COMPUTER WIN !! \n ");
            break;
        };
    };
    return (0);
};
