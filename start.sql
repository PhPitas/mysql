senaclinsenaclinsenabooksCREATE DATABASE IF NOT EXISTS senabooks
CREATE TABLE Medico (
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeMedico VARCHAR(50) NOT NULL,
loginMedico VARCHAR(50) NOT NULL,
senha CHAR(8) NOT NULL,
crm CHAR(8) NOT NULL
);
SHOW TABLES 

CREATE TABLE Recepcionista (
idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeRecepcionista VARCHAR(50) NOT NULL,
loginRecepcionista VARCHAR(50) NOT NULL,
senha CHAR(8) NOT NULL,
celular CHAR(11) NOT NULL,
nomeLoogradouro  VARCHAR(50) NOT NULL,
numero  VARCHAR(7) NOT NULL,
complemento VARCHAR(10)NULL,
cep CHAR(8) NOT NULL,
estado CHAR(2) NOT NULL
);
CREATE TABLE paciente (
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL DEFAULT 'Não informado',
tipoSanguineo VARCHAR(3) NOT NULL,
doencasPreexistentes VARCHAR(255) NULL,
CONSTRAINT chk_tipoSanquineo CHECK
(tipoSanguineo='A+'OR tipoSanguineo='A-' OR
tipoSanguineo='B+' OR tipoSanguineo='B-' OR 
tipoSanguineo='AB+' OR tipoSanguineo='AB-' OR
tipoSanguineo='O+' OR tipoSanguineo='O-')
);
CREATE TABLE Consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idMedico INT NOT NULL,
idRecepcionista INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
tipoConsulta SMALLINT DEFAULT 0,
observacoes VARCHAR(255) NOT NULL,
valor DECIMAL(7,2),
CONSTRAINT fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES Paciente(idPaciente),
CONSTRAINT fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES Medico(idMedico),
CONSTRAINT fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES Recepcionista(idRecepcionista)
);
/*Inserindo apenas um registro*/
INSERT INTO Medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Olavo','olavodoctor@gmail.com','12345678', '222333sp');
/*inserindo varios registros */
INSERT INTO Medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Thiago','thiagodoctor@gmail.com','12345678', '228363sp');
INSERT INTO Medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Heitor','heitordoctor@gmail.com','12345678', '552333sp');

SELECT * FROM medico
SELECT nomeMedico, crm FROM medico

SELECT nomeMedico, crm  FROM medico
WHERE idMedico BETWEEN 2 AND 5

INSERT INTO Medico (nomeMedico,loginMedico,crm)
VALUES ('Dr.jeitor','jeitordoctor@gmail.com', '552333sp');

UPDATE `senaclin`.`medico` SET `senha`='12345687' WHERE  `idMedico`=6;
SELECT `idMedico`, `nomeMedico`, `loginMedico`, `senha`, `crm` FROM `senaclin`.`medico` WHERE  `idMedico`=6;
SELECT * FROM medico;
WHERE crm LIKE '%sp'

SELECT * FROM medico;
ORDER BY nomeMedico DESC

SELECT * FROM medico;
ORDER BY nomeMedico ASC

INSERT INTO Recepcionista (nomeRecepcionista,loginRecepcionista,senha,celular,nomeLogradouro,numero,complemento,cep,estado)
VALUES ('MrMine','mrminememes@gmail.com','44445678', '13998411975','avenida', '20','13','11000000','sp');
INSERT INTO Recepcionista (nomeRecepcionista,loginRecepcionista,senha,celular,nomeLogradouro,numero,complemento,cep,estado)
VALUES ('Piradinha','piradinha@gmail.com','43445558', '13987464996','avenida', '10','33','11000000','rj');
INSERT INTO Recepcionista (nomeRecepcionista,loginRecepcionista,senha,celular,nomeLogradouro,numero,complemento,cep,estado,cidade)
VALUES ('Pitas','pedropita70@gmail.com','44445677', '13997411994','rua', '20','13','11000000','sp','SANTOS');

INSERT INTO paciente (nome,cpf,dataNascimento,email,tipoSanguineo,doencasPreexistentes)
VALUES ('Rogerio','65422397965','2008-04-21 16:16','rogerio@gmail.com','B+','morto');
INSERT INTO paciente (nome,cpf,dataNascimento,email,tipoSanguineo,doencasPreexistentes)
VALUES ('ryanGomes','65435887665','2008-04-21 15:57','ryangomes@gmail.com','A-','pena cova')
INSERT INTO paciente (nome,cpf,dataNascimento,email,tipoSanguineo,doencasPreexistentes)
VALUES ('Pitas','14275397395','2006-07-31 18:00','pedropita70@gmail.com','A+','supostamente vivo');

INSERT INTO consulta
(idMedico, idPaciente, idRecepcionista, dataHoraConsulta, tipoConsulta)
VALUES
(1,1,1,'2024-06-24 18:30',0)

DELETE FROM paciente 
WHERE idPaciente=3
