ApplicatieCou11
===============

Dit is de applicatie behorende bij de informaticalessen in course 11, gemaakt door Linda, Chaniek, Karen en Leonoor. De applicatie accepteert één of meer FASTA bestanden met sequenties. In een tweede bestand staat vermeld welke sequenties ortholoog aan elkaar zijn. In nog een ander bestand staan annotaties bij deze sequenties: de log ratio en de false discovery rate. Hierop wordt gefilterd, waarna een motif search plaatsvindt binnen de resulterende sequenties met behulp van MEME (http://meme.nbcr.net/meme/). Tevens worden er verscheidene plots gemaakt over de data.

De bestanden die worden gebruikt bij het runnen van de applicatie worden gespecificeerd in het bestand conf.txt. Hierbij geldt dat er één bestandsnaam per regel is gegeven. De eerste regel is de bestandsnaam voor het bestand dat de log ratio's en de fdr rates bevat, het annotatiebestand. De tweede regel is de bestandsnaam voor het bestand waarin is vermeld welke sequenties ortholoog aan elkaar zijn. De regels daaronder zijn input FASTA bestanden die worden geanalyseerd.

Code is geschreven in R en Python.

Vereisten om de applicatie te kunnen draaien:
* R is geïnstalleerd
* Python is geïnstalleerd
* MEME is geïnstalleerd in /sharing/students/meme_4.9.1/

Instructies:
1. Inloggen op cytosine.nl (leonoor, blaat1234)
2. Ga naar de map ApplicatieCou11
3. Run het volgende command: Rscript superscript.R
4. De plotjes die door R gegenereerd worden verschijnen in ApplicatieCou11
5. De MEME output staat in de mapjes die verschijnen in ApplicatieCou11
