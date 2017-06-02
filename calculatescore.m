function out = calculatescore(in)
cards = in;
score = 0 ;

for x = 1:length(cards)
    score = str2num(cards(x).value) + score;
end

if score > 21
    for z = 1:length(cards)
        if strcmpi(cards(z).number,'ACE')
            cards(z).value = '1';
            score = 0; 
            for y = 1:length(cards)
              score = str2num(cards(y).value) + score;
            end
        end
        if score < 21
            continue
        end
    end
end

out = score;
end