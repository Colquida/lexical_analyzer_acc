%{

#include <stdio.h>
#include <stdbool.h>
#define MAX_PLAYERS 4

int vAxel = 100, vGrasshopper = 100, vGrimm = 100, vHammerhead = 100, vMinion = 100, mine=0;
int vOutlaw = 100, vRoadkill = 100, vShadow = 100, totalJugadores = 0, contador=0, escenarioActual = 0, jugada = 0;
int nJugadores[4] = {50,51,52,53}, iter = 0, vEscudo=20, cooldown=0;
bool estado = false, barrera=false;
int ataque = 5;

%}
escenario1 em
escenario2 ep
escenario3 eam
escenario4 en
escenario5 ean
escenario6 eh
escenario7 ek
escenario8 ed

personaje1 pa
personaje2 pg
personaje3 pmg
personaje4 ph
personaje5 pmi
personaje6 po
personaje7 pr
personaje8 psh
personaje9 pms
personaje10 psp
personaje11 psw
personaje12 pth
personaje13 ptw
personaje14 pw
personaje15 pd
fireball {L1}{L2}{R1}{R2}{→}{←}{↑}
invisibilidad {←}{←}{↓}{↓}
freeze {↑}{↓}{↑}
fattack {→}{←}{↑}
escudo {→}{→}{↓}{↓}
mine {→}{←}{↓}
jump {↑}{←}{←}
saltarE {L1}{L2}{R1}{R2}{→}{←}{↑}{↑}{←}{←}
%%

L1L2R1R2→←↑ {printf("Fireball and freeze attack \n"); ataque=20;}
←←↓↓ {printf("Activando invisibilidad \n");}
↑↓↑ {printf("Freeze \n");}
→←↑ {printf("Freeze attack \n");ataque=10;}
→→↓↓ {printf("Escudo \n");barrera=true; cooldown=2;}
→←↓ {printf("Mine \n"); ataque=15;}
↑←← {printf("Jump \n");}

↓ {printf("Retroceder \n"); jugada += 1;}
↑ {printf("Acelerar \n");}
→ {printf("Cambiar de dirección a la derecha \n");}
← {printf("Cambiar de dirección a la izquierda \n");}
Δ {printf("Turbo \n");}
〇 {printf("Frenar \n");}
□ {printf("Acelerar \n");}
L1 {printf("Cambiar de arma a la izquierda \n");}
L2 {printf("dispara a "); jugada += 1; estado = true;}
R1 {printf("Cambiar de arma a la derecha \n");}
R2 {printf("Ametralladora \n");}

{escenario1} {printf("El escenario elegido es Moscow \n");escenarioActual += 1;}
{escenario2} {printf("El escenario elegido es Paris \n");escenarioActual += 1;}
{escenario3} {printf("El escenario elegido es Amazonía \n");escenarioActual += 1;}
{escenario4} {printf("El escenario elegido es New York \n");escenarioActual += 1;}
{escenario5} {printf("El escenario elegido es Antártica \n");escenarioActual += 1;}
{escenario6} {printf("El escenario elegido es Holland \n");escenarioActual += 1;}
{escenario7} {printf("El escenario elegido es Hong Kong \n");escenarioActual += 1;}
{escenario8} {printf("El escenario elegido es Dark Tooth \n");escenarioActual += 1;}

{personaje1} {printf("Axel ");totalJugadores += 1; nJugadores[iter] = 1; iter += 1;
		vAxel=lucha(vAxel);}
{personaje2} {printf("EL personaje elegido es Grasshopper \n");totalJugadores += 1; nJugadores[iter] = 2; iter += 1;}
{personaje3} {printf("Mr.Grimm ");totalJugadores += 1; nJugadores[iter] = 3; iter += 1;}
{personaje4} {printf("El personaje elegido es Hammerhead \n");totalJugadores += 1; nJugadores[iter] = 4; iter += 1;}
{personaje5} {printf("El personaje elegido es Minion \n");totalJugadores += 1; nJugadores[iter] = 5; iter += 1;}
{personaje6} {printf("El personaje elegido es Outlaw 2 \n");totalJugadores += 1; nJugadores[iter] = 6; iter += 1;}
{personaje7} {printf("EL personaje elegido es Roadkill \n");totalJugadores += 1; nJugadores[iter] = 7; iter += 1;}
{personaje8} {printf("El personaje elegido es Shadow \n");totalJugadores += 1; nJugadores[iter] = 8; iter += 1;}
{personaje9} {printf("El personaje elegido es Mr.Slam \n");totalJugadores += 1; nJugadores[iter] = 9; iter += 1;}
{personaje10} {printf("El personaje elegido es Spectre \n");totalJugadores += 1; nJugadores[iter] = 10; iter += 1;}
{personaje11} {printf("El personaje elegido es Sweettooth \n");totalJugadores += 1; nJugadores[iter] = 11; iter += 1;}
{personaje12} {printf("EL personaje elegido es Thumper \n");totalJugadores += 1; nJugadores[iter] = 12; iter += 1;}
{personaje13} {printf("El personaje elegido es Twister \n");totalJugadores += 1; nJugadores[iter] = 13; iter += 1;}
{personaje14} {printf("El personaje elegido es Warthog \n");totalJugadores += 1; nJugadores[iter] = 14; iter += 1;}
{personaje15} {printf("El personaje Darktooth no es seleccionable \n");}

%%

int lucha(int salud_pj){
	
	if(estado){salud_pj -= ataque; estado = false;} 
	printf("%d", salud_pj);//it's fine
	
	/*
	
	if (cooldown!=2){
		if(estado){salud_pj -= ataque; estado = false;} 
	} else {
		salud_pj+=vEscudo-ataque;
		cooldown--;
		if (cooldown==0){cooldown=2;}
	}*/
	
	/*if (barrera){salud_pj+=vEscudo; barrera = false;}*/
	printf("%d",salud_pj);
	return salud_pj;
}
void jugadorRepetido(){
    int variable1 = nJugadores[0], variable2 = nJugadores[1], variable3 = nJugadores[2], variable4 = nJugadores[3];
    if(variable1 == variable2 || variable1 == variable3 || variable1 == variable4 || variable2 == variable3 || variable2 == variable4 || variable3 == variable4){
        printf("Los jugadores están repetidos \n");
    } else {
        printf("Los jugadores son diferentes \n");       
    }
}

void turno(){
    if(jugada == 2){
        printf("Turno realizado");
        jugada = 0;    
    }else{
        printf("Se extra limito de movimientos");
        jugada = 0;
    }
	//printf("El turno de fulano");
	
}
void validarJugadores(){
    if(totalJugadores > 0 && totalJugadores <= 4){
        printf("Condición de jugadores cumplida \n");    
    }else{
        printf("Condición no cumplida de jugadores \n");    
    }
}

void validarEscenario(){
    if(escenarioActual == 1){
        printf("Condición de escenario cumplida \n");    
    }else{
        printf("Condición no cumplida de escenario \n");    
    }
}

yywrap(){}
int main(){
    //printf("Bienvenidos al Himalaya, ¿Helado?");
    yylex();

    //validarJugadores();
    //validarEscenario();
    //turno();
    jugadorRepetido();
    printf("%d\n",vAxel);
    
    
	return 0;
}
