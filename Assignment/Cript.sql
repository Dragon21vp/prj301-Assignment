USE Assignment;
GO

CREATE TABLE Users (
    username   NVARCHAR(50) PRIMARY KEY,  
    password   NVARCHAR(50) NOT NULL,     
    fullName   NVARCHAR(100) NOT NULL,    
    department NVARCHAR(50) NOT NULL,     
    role       NVARCHAR(50) NOT NULL      
);
GO

INSERT INTO Users (username, password, fullName, department, role)
VALUES
(N'MrA', N'1234', N'Nguyễn Văn A', N'IT', N'Administrator'), 
(N'MrB', N'2345', N'Nguyễn Văn B', N'IT', N'Manager'),
(N'MrC', N'3456', N'Nguyễn Văn C', N'HR', N'Manager'),
(N'D',   N'4567', N'Trần Thị D',   N'IT', N'Employee'),
(N'E',   N'5678', N'Lê Thị E',     N'Finance', N'Employee'),
(N'F',   N'6789', N'Hoàng Văn F',  N'Marketing', N'Employee');
GO


CREATE TABLE LeaveRequests (
    requestId INT IDENTITY(1,1) PRIMARY KEY,  
    username NVARCHAR(50) NOT NULL,          
    fromDate DATE NOT NULL,                  
    toDate DATE NOT NULL,                   
    reason NVARCHAR(MAX) NOT NULL,          
    status NVARCHAR(20) NOT NULL 
        DEFAULT 'Inprogress',                
    processedBy NVARCHAR(50) NULL,           
    processedDate DATETIME NULL              
);
GO

ALTER TABLE LeaveRequests
ADD CONSTRAINT FK_LeaveRequests_Users
FOREIGN KEY (username) REFERENCES Users(username);
GO


SELECT * FROM Users;
SELECT * FROM LeaveRequests;