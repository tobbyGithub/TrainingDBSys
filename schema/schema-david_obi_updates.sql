create table ExternalTraining (
        id bigint not null auto_increment,
        createdBy varchar(255),
        createdDate datetime,
        lastUpdated datetime,
        lastUpdatedBy varchar(255),
        version integer not null,
        country longtext,
        educationalInfo longtext,
        email varchar(50),
        firstName longtext,
        fullName longtext,
        gaintFromCourse longtext,
        gender varchar(10),
        jobTitle varchar(100),
        lastName longtext,
        officeAddress longtext,
        organization longtext,
        otherNames longtext,
        phone varchar(50),
        relevantAreasInterest longtext,
        title longtext,
        primary key (id)
    ) ENGINE=InnoDB;

    