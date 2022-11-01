
% 190020003
% akshay kiran jose

clear all; clc; close all;

input = 'this string is going to get huffman encoded and decoded'

[distribution_symbols, huffmancellarray] = huffmancell(input)

encoded = huffmanencode(input, huffmancellarray);

printencoded = sprintf("%d", encoded)

decoded = huffmandecode(encoded, huffmancellarray)