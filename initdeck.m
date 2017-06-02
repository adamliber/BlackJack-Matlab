function out = initdeck
%INITDECK creates structure array of 52 playing cards
%structure has 3 attributes number,suit, and value

card = struct('suit',[],'number',[],'value',[]);

full = repmat(card,1,52);

for r = 0:3
    q = r*13;
for v = 1:13
    card(v+q).number = num2str(v);
    card(v+q).value = num2str(v);
end
end

for a = 1:52
    switch card(a).number
        case '1'
            card(a).number = 'ACE';
        case '2'
            card(a).number = 'TWO';
        case '3'
            card(a).number = 'THREE';
        case '4'
            card(a).number = 'FOUR';
        case '5'
            card(a).number = 'FIVE';
        case '6'
            card(a).number = 'SIX';
        case '7'
            card(a).number = 'SEVEN';
        case '8'
            card(a).number = 'EIGHT';
        case '9'
            card(a).number = 'NINE';
        case '10'
            card(a).number = 'TEN';
        case '11'
             card(a).number = 'JACK';
        case '12'
             card(a).number = 'QUEEN';
        case '13'
             card(a).number = 'KING';
    end
end

[card(1:13).suit] = deal('DIAMONDS');
[card(14:26).suit] = deal('HEARTS');
[card(27:39).suit] = deal('SPADES');
[card(40:52).suit] = deal('CLUBS');

for b = 1:52
    switch card(b).value
        case '1'
            card(b).value = num2str(11);
        case {'11','12','13'}
             card(b).value = num2str(10);
    end
end

out = card;

end





    
    
    
