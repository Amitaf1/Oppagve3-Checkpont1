CREATE TABLE Bruker (
	BrukerID SERIAL PRIMARY KEY,
	Navn TEXT NOT NULL,
	Epost TEXT NOT NULL UNIQUE,
	Passord CHAR(8) NOT NULL
);


CREATE TABLE Podkast (
	PodkastID SERIAL PRIMARY KEY,
	Navn TEXT NOT NULL,
	Beskrivelse TEXT,
	Kategori TEXT,
	Språk TEXT NOT NULL,
	Utgiver TEXT NOT NULL,
	Bilde VARBINARY
);


CREATE TABLE Episode (
	EpisodeID SERIAL PRIMARY KEY,
 	PodkastID INT REFERENCES Podkast(PodkastID) ON DELETE CASCADE,
	Tittel TEXT NOT NULL,
	Beskrivelse TEXT,
	Varighet INT,
	Dato DATE NOT NULL,
	Lydfil TEXT NOT NULL,
	TekstligRepresentasjon TEXT
);

