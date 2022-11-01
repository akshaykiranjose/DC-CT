function decoded = SyndromeDecode(received, H)

%     received: a vector of recieved bits, can also be a matrix 
%     size = (n, num_vectors)
%     H_transpose: transpose of the parity check matrix

    H_transpose = transpose(H);
    syndrome = matmul(received, H_transpose);
    loc = find(ismember(H_transpose, syndrome, 'rows'));
%     find location of one-bit error


% what about 2 bit errors?

    

    decoded = received;
    decoded(loc) = mod(decoded(loc) + 1, 2);
%     change the bit at that location

end