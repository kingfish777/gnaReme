<!ELEMENT Folktale (Move+)>
<!ATTLIST Folktale
	Title CDATA #REQUIRED
>

<!--      "Morphologically, a tale (skazka) may be termed any development proceeding from villainy (A) or a lack

(a), through intermediary functions to marriage (W*),  or to other functions employed as a denouement.  Terminal

functions are at  times a reward (F), a gain or in general the liquidation of misfortune (K), an escape from pursuit

(Rs), etc.  This type of development is termed by us a move (khod).  Each new act of villainy, each new lack

creates a new move ....  when analyzing a text, one must first of all determine the number of moves of which a

tale consists....  However, if we have conditionally defined the tale as a move, this still does not mean that the

number of moves corresponds to the number of tales.  Special devices of parallelism,  repetitions, etc., lead to

the fact that one tale may be composed of several  moves." pg. 92, "the Ways in which Stories are

Combined" -->

<!ELEMENT Move (Preparation?, 



	DonorFunctions?, 


	(Villainy | 

	

	Lack)?, 

	

	ConnectiveIncident?, 

	

	ConsentToCounteraction?, 

	

	Move?, 

	

	Departure?, 

	

	DonorFunctions?, 

	

	Transference?,

	

	 StruggleVictory?, 


	 LiquidationOfLack?, 

	 

	 Move?, 

	 

	 Return?, 

	 

	 PursuitRescueOfHero?, 

	 

	 UnrecognizedArrival?, 

	 

	 ClaimsOfFalseHero?) | 

	 

	 (LiquidationOfLack?, 

	 

	 Return?, 

	 

	 PursuitRescueOfHero?, 

	 

	 UnrecognizedArrival?, 

	 

	 ClaimsOfFalseHero?, 

	 

	 Task?,

	 

	 Wedding?, 

	 

	 RecognitionOfHero?, 

	 

	 ExposureOfFalseHero?, 

	 

	 Transfiguration?, 

	 

	 PunishmentOfFalseHero?, 

	 

	 AlienForms?,

	 

	 RecognitionOfHero?, 

	 

	 ExposureOfFalseHero?, 

	 

	 Transfiguration?, 

	 

	 PunishmentOfFalseHero?, 

	 

	 Wedding?, 

	 

	 AlienForms?, 

	 

	 Return?, 

	 

	 Epilogue?>

<!-- CONTENT MODEL -->

<!ELEMENT Preparation>

<!ELEMENT Preparation (#PCDATA)>


<!ELEMENT Villainy (#PCDATA)>

<!ELEMENT Lack (#PCDATA)>

<!ELEMENT ConnectiveIncident (#PCDATA)>

<!-- C or ConsentToCounteraction -->

<!ELEMENT ConsentToCounteraction (#PCDATA)>

<!-- ^ or Departure from Home -->

<!ELEMENT Departure (#PCDATA)>

<!-- D:  Luke meets the cantankerous OB-1 -->

<!ELEMENT DonorFunctions (#PCDATA)>


<!--H-I or Struggle-Victory Sequence-->

<!ELEMENT StruggleVictory (#PCDATA)>

<!ELEMENT LiquidationOfLack (#PCDATA)>

<!-- Return of Hero -->

<!ELEMENT Return (#PCDATA)>

<!--Pr-Rs or Pursuit-Rescue Sequence-->

<!ELEMENT PursuitRescueOfHero (#PCDATA)>

<!-- o:  _O_dysseus arriveth to Ithica Incognito -->

<!ELEMENT UnrecognizedArrival (#PCDATA)>

<!-- L -->

<!ELEMENT ClaimsOfFalseHero (#PCDATA)>

<!--M-N or Task Sequence-->

<!ELEMENT Task (#PCDATA)>

<!-- Q:  the queen's maid, bathing little so-and-so recognizes his scar ... -->

<!ELEMENT RecognitionOfHero (#PCDATA)>

<!-- Ex: you win this time, little so-and-so, but soon we shall meet again! -->

<!ELEMENT ExposureOfFalseHero (#PCDATA)>

<!-- T -->

<!ELEMENT Transfiguration (#PCDATA)>

<!ATTLIST Transfiguration (#PCDATA)>

<!-- U or U.neg -->

<!ELEMENT PunishmentOfFalseHero (#PCDATA)>

<!ATTLIST PunishmentOfFalseHero (#PCDATA)>

<!-- W: little so-and-so is given dominion over all known

	Universe and betrothed to the princess -->

<!ELEMENT Wedding (#PCDATA)>

<!ATTLIST Wedding (#PCDATA)>

<!-- X:  Lepus Rex takes over the Galaxy -->

<!ELEMENT AlienForms (#PCDATA)>

<!-- Farewell - now mead runs down my mustache - and scarcely a trickle clears my mouth!  -->

<!ELEMENT Epilogue (#PCDATA)>
