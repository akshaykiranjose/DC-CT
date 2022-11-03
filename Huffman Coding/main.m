
% 190020003
% akshay kiran jose

clear all; clc; close all;

input = 'HuffmannEncoding'

[distribution_symbols, huffmancellarray] = huffmancell(input)

encoded = huffmanencode(input, huffmancellarray);

printencoded = sprintf("%d", encoded)

decoded = huffmandecode(encoded, huffmancellarray)