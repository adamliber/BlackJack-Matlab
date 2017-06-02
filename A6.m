%{
Adam Liber
ITP 168 - Fall 2015
Homework 6
aliber@usc.edu

date                   change                 programmer
--------------------------------------------------------
10/21/2015              original               Adam Liber
%}
replay = 1;
while replay
deck = initdeck();
sdeck = shuffle(deck);

[pc1 ndeck] = dealcard(sdeck);
[pc2 ndeck] = dealcard(ndeck);
player = [pc1 pc2];


disp('Player:')
printcard(player);fprintf('\n')

[dc1 ndeck] = dealcard(ndeck);
[dc2 ndeck] = dealcard(ndeck);
dealer = [dc1 dc2];

disp('Dealer:')
printcard(dealer);fprintf('\n')

pScore = calculatescore(player);
dScore = calculatescore(dealer);

if pScore == 21 && dScore == 21
    fprintf('Its a tie. you PUSH.\n');
    play = 0;
elseif  pScore == 21 && dScore ~= 21
    fprintf('BLACK JACK! you WIN\n');
    play = 0;
elseif  pScore ~= 21 && dScore == 21
    fprintf('Dealer wins\n'); 
    play = 0;
else
    play = 1;
end

while play
hit = 1;
while hit
fprintf('Player score: %.0f \n',pScore);
move = input('Hit or Stand?(H/S): ','s');
switch move
    case {'h','H'}
        [pc ndeck] = dealcard(ndeck);
        player = [player pc];
        pScore = calculatescore(player);
        printcard(pc);
    case {'s','S'}
        hit = 0;
end

if pScore > 21
    fprintf('Player score: %.0f',pScore);
    fprintf('\nBUST! Dealer Wins\n');
    hit = 0;
    hit2 = 0;
else
    hit2 = 1;
end 

end

while hit2
fprintf('Dealer score: %.0f \n',dScore);

if dScore<18
move = 'h';
else
move = 's';
end

switch move
    case {'h','H'}
        [dc ndeck] = dealcard(ndeck);
        dealer = [dealer dc];
        dScore = calculatescore(dealer);  
        fprintf('Dealer Hits\n');
        printcard(dc);
    case {'s','S'}
        hit2 = 0;
end

if dScore > 21
    fprintf('Dealer score: %.0f',dScore);
    fprintf('\nDealer BUSTS! you win\n');
    hit2=0;
end

end

if (pScore <= 21) && (dScore <= 21)
    if pScore > dScore
    fprintf('you WIN\n')
    elseif pScore == dScore
    fprintf('Its a tie. you PUSH\n')
    else
    fprintf('Dealer wins\n')
    end
end
play=0;
end

replay = input('Want to play again?(Y/N): ','s');
switch replay
    case {'y','Y'}
        replay = 1;
        fprintf('\n');
    otherwise 
        replay = 0;
end
end        
        
        
        
        
