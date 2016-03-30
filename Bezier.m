%Approximation einer Bezierkurve (Kurve und ein Konstruktionsschritt
%wird geplottet)
%Eingabeparameter: Kontrollpunkte (2-Dimensionales Array),
%Streckenteilungsparamter t
%Ausgabe: Bezierkurve fuer das gesetzte Kontrollpolygon
%Ersteller: Maximilian Kapsecker
%Version: 1.0

%Example Function Call:
%S = [0,1,2,3,4; 0,1,2,2,1];
%Bezier(S,0.5);

function Bezier = Bezier(S,t)

    for k = 0:0.01:1
        Q(:,round(k*100+1)) = deCasteljau(S,k,0);
    end

    deCasteljau(S,t,1);
    hold on;

Bezier = plot(Q(1,:),Q(2,:),'r','LineWidth',2);
