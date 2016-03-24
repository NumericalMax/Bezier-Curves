%De-Casteljau Algorithmus zum Errechnen und Plotten von Bezierkurven
%Eingabeparameter: Kontrollpunkte (2-Dimensionales Array),
%Streckenteilungsparamter t, Boolean Wert ob Kontrollpunkte und 
%Konstruktionspunkte gezeichnet werden sollen
%Ausgabe: Punkt auf der Bezierkurve fuer das gesetzte Kontrollpolygon in
%Abhaengigkeit von t
%Ersteller: Maximilian Kapsecker
%Version: 1.2
function Casteljau = deCasteljau(P_Start,t,draw)

L = size(P_Start,2);

%Initialisierung
%Der erste Eintrag entspricht hierbei 1 fuer den x-Achsen Abschnitt
%und 2 fuer den y-Achsen Abschnitt
%Der zweite Eintrag entspricht demnach einem (x,y) Punkt
%Der dritte Eintrag wird genutzt um anzugeben in welchem Iterationsschritt
%man sich gerade befindet
P(:,:,1) = P_Start;

if draw == 1
    %Minima und Maxima fuer Axen-Skalierung ermitteln
    M1 = max(P(1,:,1));
    M2 = max(P(2,:,1));
    m1 = min(P(1,:,1));
    m2 = min(P(2,:,1));

    %Verschiebung der labels,
    %so dass diese nicht direkt auf den Punkten erscheinen
    dx = 0.1;
    dy = 0.1;

    %Plotten des Kontrollpolygons und skalieren der Axen
    plot(P(1,:,1),P(2,:,1), 'k');
    axis([(m1-1) (M1+1) (m2-1) (M2+1)]);
    title(sprintf('t = %.2f', t));
    hold on;

    %Plotten der Kontrollpunkte
    scatter(P(1,:,1),P(2,:,1),'filled','b');
    for i=1:1:L
        d2 = num2str(i);
        c = ['P(0,' d2 ')'];
        q = text(P(1,i,1)+dx, P(2,i,1)+dy, c);
        set(q, 'FontSize', 10); 
    end
    hold on;
end

%Konstruktion des Bezierkurvenpunktes
for i=1:1:L
    for j=1:1:L-i
        
            %i-ter Iterationsschritt fuer die x-Achse
            P(1,j,i+1) = (1-t)*P(1,j,i) + t*P(1,j+1,i);
            P(2,j,i+1) = (1-t)*P(2,j,i) + t*P(2,j+1,i);
            
            if draw == 1
                %Plotten der Verbindungsgeraden im i-ten Iterationsschritt
                if j > 1
                    plot(P(1,j-1:j,i+1),P(2,j-1:j,i+1), 'k');
                    hold on; 
                end
            
                %Plotten der Konstruktionspunkte im i-ten Iterationsschritt
                scatter(P(1,j,i+1),P(2,j,i+1),[],i,'filled');
                d1 = num2str(i);
                d2 = num2str(j);
                c = ['P(' d1 ',' d2 ')'];
                q = text(P(1,j,i+1)+dx, P(2,j,i+1)+dy, c);
                set(q, 'FontSize', 10);
                hold on;
            end
    end
end
Casteljau = P(:,1,L);
