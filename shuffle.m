function out = shuffle(in)
%SHUFLLE randomizes the order of elements in a structure array

card = in;
numcards = length(card);

for x = 1:1000
    flip = randi(numcards);
    flop = randi(numcards);
    cardcup =  card(flip);
    card(flip) = card(flop);
    card(flop) = cardcup;
end
out = card;
end
