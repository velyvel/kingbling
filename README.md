# [그린컴퓨터아카데미] B2B 악세서리 쇼핑몰

스프링 부트와 JPA를 사용하여 만든 악세서리 쇼핑몰입니다.
사업자 인증에 필요한 OCR 기능을 파이썬 라이브러리를 사용하여 추가하였습니다.

주요 기능
- 네이버 api 를 사용한 상품 데이터 구현
- chart.js 를 활용한 admin 페이지 함께 구현, 매출 및 현황 분석 가능
- 파이썬 tesseract로 사업자 등록증 데이터 읽기, 사업자 인증번호 진위여부 api 활용해 인증할 수 있도록 구현

기술 스택
Spring Boot: 웹 애플리케이션 백엔드 구성
Spring Data JPA: 데이터베이스와의 ORM(Object-Relational Mapping)을 위해 사용
Oracle Database: 데이터 저장소로 Oracle 사용
Tomcat Jasper: JSP 뷰를 렌더링
