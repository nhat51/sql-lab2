CREATE DATABASE Booklibraly
GO
USE Booklibraly

CREATE TABLE Book(
BookCode INT  ,
BookTitle VARCHAR(100) NOT NULL,
Author VARCHAR(50) NOT NULL,
Editition INT,
BookPrice MONEY,
Copies INT,
CONSTRAINT BookStore PRIMARY KEY (BookCode)
)
GO
DROP TABLE Book

CREATE TABLE Member(
MemberCode INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Address VARCHAR(100) NOT NULL,
PhoneNumber INT,
CONSTRAINT PK_Member PRIMARY KEY (MemberCode)
)
GO
DROP TABLE Member
GO
CREATE TABLE IssueDetail(
BookCode INT,
MemberCode INT,
CONSTRAINT fk_Code FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
CONSTRAINT dmm FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode),
IssueDate DATETIME,
ReturnDate DATETIME
)
GO
DROP TABLE IssueDetail
GO
--Xóa bỏ các Ràng buộc Khóa ngoại của bảng IssueDetails
ALTER TABLE IssueDetail
	DROP CONSTRAINT dmm
GO
ALTER TABLE IssueDetail
	DROP CONSTRAINT fk_Code
Go
--Xóa bỏ Ràng buộc Khóa chính của bảng Member và Book
ALTER TABLE Member
	DROP CONSTRAINT PK_Member
GO
ALTER TABLE Book
	DROP CONSTRAINT BookStore
GO
--Thêm mới Ràng buộc Khóa chính cho bảng Member và Book
ALTER TABLE Member
	ADD CONSTRAINT Nhat PRIMARY KEY (MemberCode)
GO
ALTER TABLE Book
	ADD CONSTRAINT NhatBook PRIMARY KEY (BookCode)
GO
--Thêm mới các Ràng buộc Khóa ngoại cho bảng IssueDetails
ALTER TABLE IssueDetail
	ADD CONSTRAINT Nhatfk_code FOREIGN KEY (BookCode) REFERENCES Book(BookCode)
GO
ALTER TABLE IssueDetail
	ADD CONSTRAINT Nhatdmm FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)
GO
--Bổ sung thêm Ràng buộc giá bán sách > 0 và < 200
ALTER TABLE Book
	ADD CONSTRAINT PRICE
	CHECK (BookPrice BETWEEN 0 AND 200)
GO
--Bổ sung thêm Ràng buộc duy nhất cho PhoneNumber của bảng Member
ALTER TABLE Member
	ADD CONSTRAINT Phone UNIQUE (PhoneNumber)
GO
--Bổ sung thêm ràng buộc NOT NULL cho BookCode, MemberCode trong bảng IssueDetails
ALTER TABLE IssueDetail 
	ALTER COLUMN BookCode INT NOT NULL
GO
ALTER TABLE IssueDetail 
	ALTER COLUMN MemberCode INT NOT NULL
GO
--Tạo khóa chính gồm 2 cột BookCode, MemberCode cho bảng IssueDetails
ALTER TABLE IssueDetail
	ADD CONSTRAINT PK PRIMARY KEY (BookCode, MemberCode)
GO
INSERT INTO Book (BookCode ,BookTitle ,Author ,Editition ,BookPrice ,Copies) VALUE (431,'Cho tôi xin một vé về tuổi thơ', 'Nguyễn Nhật Ánh', 2, 115,100)
)