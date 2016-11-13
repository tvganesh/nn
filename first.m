function [w] = first()
echo off
clear ; close all; clc
#load dataset2
dataset5
num_neg_examples = size(neg_examples_nobias,1);
num_pos_examples = size(pos_examples_nobias,1);

neg_examples = [neg_examples_nobias,ones(num_neg_examples,1)];
pos_examples = [pos_examples_nobias,ones(num_pos_examples,1)];
w= rand(3,1);

[errors0, errors1] = get_errors(neg_examples, pos_examples,w);
total_errors = size(errors0)(1) + size(errors1)(1);
iter=0;
while (total_errors > 0) 
 iter = iter + 1
 %Update the weights of the perceptron.
   
   #w = compute_weights(neg_examples,pos_examples,w)
   w = compute_activation(neg_examples,pos_examples,w)
   [errors0, errors1] = get_errors(neg_examples, pos_examples,w);
   total_errors = size(errors0) + size(errors1);
   fprintf('Number of errors in iteration %d:\t%d\n',iter,total_errors);
 
   decision_line_plot(neg_examples, pos_examples,  w);
   key = input('<Press enter to continue, q to quit.>', 's');
   if (key == 'q')
        break;
    end
end
endfunction