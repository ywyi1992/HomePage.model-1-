drop table image
create table image(
	no			number(7)  not null,  -- 글 번호
	name		VARCHAR(20)   NOT NULL, -- 글쓴이
	title		VARCHAR(150)   NOT NULL, -- 글 제목
	content		VARCHAR(4000)   NOT NULL, -- 글 내용
	passwd		VARCHAR(20)   NOT NULL, -- 패스워드
	viewcnt		number(7)  default 0, -- 조회수
	wdate		date  not null, -- 등록 날짜
	gno			number(7)  default 0, -- 부모글 번호
	ino			number(7)  default 0, -- 답변여부
	ano			number(7)  default 0, -- 답변 순서
	filename	VARCHAR(20)   default 'image.jpg',	
	
	primary key (no)
)

select * from image

alter table image
add(refno number default 0)


insert into image(no,name,title,content,passwd,viewcnt,wdate,filename)
values((SELECT NVL(MAX(no), 0) + 1 as no FROM image),'유저5','제목','내용','1234','1',sysdate,'a11.jpg')

delete from image
where no = 3

SELECT * FROM 
  ( 
     select   
         lag(no,2)     over (order by no) pre_imgno2,  
         lag(no,1)     over (order by no ) pre_imgno1, 
         no,
         lead(no,1)    over (order by no) nex_imgno1,  
         lead(no,2)    over (order by no) nex_imgno2,
         lag(filename,2)  over (order by no) pre_file2,   
         lag(filename,1)  over (order by no ) pre_file1,
         filename, 
         lead(filename,1) over (order by no) nex_file1,
         lead(filename,2) over (order by no) nex_file2 
         from ( 
              SELECT no, filename  
              FROM image
              ORDER BY no DESC 
         ) 
  ) 
  WHERE no = 3
