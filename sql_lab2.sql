CREATE DATABASE LAB1;
USE LAB1;

create table person(
	p_id INT AUTO_INCREMENT primary key ,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email_address varchar(50) not null,
    affiliation varchar(30) not null,
    start_date date not null,
    end_date date
);

create table student(
	s_id int primary key,
	academic_program varchar(10)  not null,
    foreign key(s_id) references person (p_id)
);

create table employee(
    e_id int primary key,
    supervisor_id int,
    phone varchar(13) not null,
    report varchar(13),
    office varchar(10) not null,
    foreign key(e_id) references person(p_id),
    foreign key(supervisor_id) references employee(e_id)
    );
    
create table academic(
	academic_id int primary key,
    foreign key(academic_id) references employee(e_id)
);

create table faculty(
	faculty_id int primary key,
	position varchar(20) not null,
    foreign key(faculty_id) references academic(academic_id)
);

create table non_academic(
	non_academic_id int primary key,
    foreign key(non_academic_id) references employee(e_id)
);

create table administrative(
	administrative_id int primary key,
	position varchar(20) not null,
    foreign key(administrative_id) references non_academic(non_academic_id)
);

create table technical(
	technical_id int primary key,
	position varchar(20) not null,
    foreign key(technical_id) references non_academic(non_academic_id)
);
create table advises(
	student_id int not null,
    academic_id int not null,
    primary key(student_id,academic_id),
    foreign key(student_id) references student (s_id),
    foreign key(academic_id) references academic (academic_id)
);

create table laboratory(
	lab_id int AUTO_INCREMENT primary key,
    name varchar(50) not null,
    building varchar(50) not null,
    room_number int not null,
    discipline varchar(50) not null,
    faculty_id int not null,
    foreign key(faculty_id) references faculty (faculty_id)
);

create table reaserchProject(
	code int AUTO_INCREMENT primary key,
    title varchar(50) not null,
    start_date date not null,
    end_date date not null,
    status varchar(10) not null
    );

create table budget(
	budget_line varchar(100) primary key,
    amount_granted float not null,
    amount_disbursed float not null,
    start_date date not null,
    end_date date not null,
    academic_id int not null,
    foreign key(academic_id) references academic(academic_id)
);

create table fundslab(
	lab_id int,
    budget_line varchar(100),
    primary key(lab_id, budget_line),
    foreign key(lab_id) references  laboratory(lab_id), 
    foreign key(budget_line) references budget(budget_line)
); 

create table fundsproject(
	project_code int,
    budget_line varchar(100),
    primary key(project_code, budget_line),
    foreign key(project_code) references  reaserchProject(code), 
    foreign key(budget_line) references budget (budget_line)
); 

create table participates(
	project_code int,
    person_id int,
    role varchar(10),
    primary key(person_id, project_code),
    foreign key(person_id) references person(p_id),
    foreign key(project_code) references reaserchProject(code)
);

create table attached(
	person_id int,
    lab_id int,
    primary key(person_id,lab_id),
    foreign key(person_id) references person(p_id),
    foreign key(lab_id) references laboratory (lab_id)
);

CREATE TABLE equipmentModel (
    model_id  varchar(50) primary key,
    commercial_name varchar(100) not null,
    manufacturer varchar(100) not null,
    category varchar(50) not null,
    required_environment varchar(200) not null,
    training_mandatory bool not null
);

CREATE TABLE equipmentUnit (
    serial_number  varchar(50) primary key,
    acquisition_date  date not null,
    purchase_cost float not null,
    status varchar(20) not null,
    is_portable bool not null,
    lab_id int not null,
    model_id varchar(50) not null,
    foreign key (model_id) references equipmentModel(model_id),
    foreign key (lab_id) references laboratory(lab_id)
);

CREATE TABLE certification (
    code  int PRIMARY KEY,
    title varchar(50) not null,
    issuing_authority varchar(50) not null,
    validity_start date not null,
    validity_end date not null,
    safety_level varchar(50) not null
);

create table requires(
	equipment_model_id varchar(50),
    certification_code int,
    primary key(equipment_model_id,certification_code),
    foreign key(equipment_model_id) references equipmentModel(model_id),
    foreign key(certification_code) references certification(code)
);

create table holds(
    certification_code int,
    person_id int,
    expiration_date date not null,
    grade float not null,
    issue_date date not null,
    primary key(certification_code, person_id),
    foreign key(certification_code) references certification(code),
    foreign key(person_id) references person(p_id)
);

create table reservation (
    id int AUTO_INCREMENT primary key,
    submission_timestamp date not null,
    planned_start_time date not null,
    planned_end_time date not null,
    purpose varchar(200) not null,
    status varchar(15) default "Pending",
    reaserch_project_code int not null,
    person_approver_id int,
    perso_reservation_maker int not null,
    foreign key(reaserch_project_code) references reaserchProject(code),
    foreign key(perso_reservation_maker) references person(p_id),
    foreign key(person_approver_id) references person(p_id)
);

create table reserves(
	reservation_id int,
    equipment_unit_serial_no varchar(50),
    primary key(reservation_id,equipment_unit_serial_no),
    foreign key(reservation_id) references reservation(id),
    foreign key(equipment_unit_serial_no) references equipmentUnit(serial_number)
);

create table maintenance (
    equipment_unit_serial_no varchar(50),
    start_timestamp date not null,
    end_timestamp date not null,
    type varchar(10) not null,
    description varchar(200) not null,
    cost float not null,
    outcome varchar(20) not null,
    technical_id int not null,
    primary key(equipment_unit_serial_no, start_timestamp),
    foreign key(technical_id) references technical(technical_id),
    foreign key(equipment_unit_serial_no) references equipmentUnit(serial_number)
    
);

create table calibrationRecord(
    equipment_unit_serial_no varchar(50),
    calib_date date not null,
    calib_type varchar(20) not null,
    result varchar(10) not null,
    next_due_date date not null,
    remarks varchar(200) not null,
    primary key(equipment_unit_serial_no, calib_date),
    foreign key(equipment_unit_serial_no) references equipmentUnit(serial_number)
);

create table consumable(
    id int primary key,
    name varchar(100) not null,
    unit_of_mesure varchar(20) not null,
    hazard_level float not null,
    reorder_threshold float not null
);

create table supplier(
	id int primary key,
    name varchar(50) not null,
    contact_email varchar(50) not null,
    phone_number varchar(13) not null    
);
    
create table supplies(
    consumable_id int,
    supplier_id int,
    lab_id int,
    unit_price float not null,
    primary key(consumable_id, supplier_id, lab_id),
    foreign key(consumable_id) references consumable(id),
    foreign key(supplier_id) references supplier(id),
    foreign key(lab_id) references laboratory(lab_id)
);
    
create table stock(
    consumable_id int,
    lab_id int,
    quantity_on_hand int not null,
    last_restock_date date not null,
    storage_condition varchar(200) not null,
    monitoring_since date,
    technical_id int not null,
    primary key(consumable_id, lab_id),
    foreign key(consumable_id) references consumable(id),
    foreign key(lab_id) references laboratory(lab_id),
    foreign key(technical_id) references technical(technical_id)
);

create table consumes(
    reservation_id int,
    stock_consumable_id int,
    stock_lab_id int,
    quantity_used int not null,
    primary key (reservation_id, stock_consumable_id, stock_lab_id),
    foreign key (reservation_id) references reservation(id),
    foreign key (stock_consumable_id, stock_lab_id) references stock(consumable_id, lab_id)
);



