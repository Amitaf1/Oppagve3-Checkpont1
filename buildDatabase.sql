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

INSERT INTO Bruker (Navn, Epost, Passord) VALUES
	('Line Nordmann', 'line.nordmann@example.com', 'password123'),
	('Kari Nordmann', 'kari.nordmann@example.com', 'password456');

INSERT INTO Podkast (Navn, Beskrivelse, Kategori, Språk, Utgiver, Bilde) values
	('C# - Why not C minor?', 'A place to learn about C# (as a language) and have fun.', 'Teknologi', 'English', 'CCoder', 'https://example.com/images/csharp.jpg'),
	('Animal Planet podcast', 'Animal planet narrated by David Attenborough.', 'Wildlife', 'English', 'Animal Planet', 'https://example.com/images/wildlife.jpg');

INSERT INTO Episode (PodkastID, Tittel, Beskrivelse, Varighet, Dato, Lydfil, TekstligRepresentasjon) VALUES
	(1, 'Generics and other things.', 3600, '2024-08-30', 'https://example.com/audio/ep1.mp3', 'Transcription here.'),
	(1, 'Variables are fun.', 'How to use variables and have fun with them.', 4200, '2024-08-31', 'https://example.com/audio/ep2.mp3', 'Transcription here.'),
	(2, 'Lions - The Mufasa tribe', 'How a pride of lions survive after the death of the male - Mufasa.', 1800, '2024-09-01', 'https://example.com/audio/ep3.mp3', 'Transcription here.');

