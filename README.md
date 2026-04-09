# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Lance Thrall, Calvin McKee

## Summary

In this lab we used D flipflops and T flipflops to make different kinds of counters

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?

The modulo counter divides the clock by 2*count because it stays on for the count then off for the count, which means 1 on off is double the length of the count.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?

It goes to all 1s the first clock cycle because right at the begnining every single one of them has a clock signal that triggers imediately.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?

To get an output of roughly 1 KHz you would want to use a width of 10, because it would half it 10 times, getting just around 1KHz