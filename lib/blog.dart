class Blog {
  int? blogID;
  String? blogTitle;
  String? blogContent;
  String? blogImage;
  String? blogCreatedAt;
  bool? blogStatus;
  int? categoryID;
  Category? category;
  int? writerID;
  Writer? writer;

  Blog({
    this.blogID,
    this.blogTitle,
    this.blogContent,
    this.blogImage,
    this.blogCreatedAt,
    this.blogStatus,
    this.categoryID,
    this.category,
    this.writerID,
    this.writer,
  });

  Blog copyWith({
    int? blogID,
    String? blogTitle,
    String? blogContent,
    String? blogImage,
    String? blogCreatedAt,
    bool? blogStatus,
    int? categoryID,
    Category? category,
    int? writerID,
    Writer? writer,
  }) {
    return Blog(
      blogID: blogID ?? this.blogID,
      blogTitle: blogTitle ?? this.blogTitle,
      blogContent: blogContent ?? this.blogContent,
      blogImage: blogImage ?? this.blogImage,
      blogCreatedAt: blogCreatedAt ?? this.blogCreatedAt,
      blogStatus: blogStatus ?? this.blogStatus,
      categoryID: categoryID ?? this.categoryID,
      category: category ?? this.category,
      writerID: writerID ?? this.writerID,
      writer: writer ?? this.writer,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blogID': blogID,
      'blogTitle': blogTitle,
      'blogContent': blogContent,
      'blogImage': blogImage,
      'blogCreatedAt': blogCreatedAt,
      'blogStatus': blogStatus,
      'categoryID': categoryID,
      'category': category,
      'writerID': writerID,
      'writer': writer,
    };
  }

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      blogID: json['blogID'] as int?,
      blogTitle: json['blogTitle'] as String?,
      blogContent: json['blogContent'] as String?,
      blogImage: json['blogImage'] as String?,
      blogCreatedAt: json['blogCreatedAt'] as String?,
      blogStatus: json['blogStatus'] as bool?,
      categoryID: json['categoryID'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      writerID: json['writerID'] as int?,
      writer: json['writer'] == null
          ? null
          : Writer.fromJson(json['writer'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() =>
      "Blog(blogID: $blogID,blogTitle: $blogTitle,blogContent: $blogContent,blogImage: $blogImage,blogCreatedAt: $blogCreatedAt,blogStatus: $blogStatus,categoryID: $categoryID,category: $category,writerID: $writerID,writer: $writer)";

  @override
  int get hashCode => Object.hash(blogID, blogTitle, blogContent, blogImage,
      blogCreatedAt, blogStatus, categoryID, category, writerID, writer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Blog &&
          runtimeType == other.runtimeType &&
          blogID == other.blogID &&
          blogTitle == other.blogTitle &&
          blogContent == other.blogContent &&
          blogImage == other.blogImage &&
          blogCreatedAt == other.blogCreatedAt &&
          blogStatus == other.blogStatus &&
          categoryID == other.categoryID &&
          category == other.category &&
          writerID == other.writerID &&
          writer == other.writer;
}

class Category {
  int? categoryID;
  String? categoryName;
  String? categoryDescription;
  bool? categoryStatus;

  Category({
    this.categoryID,
    this.categoryName,
    this.categoryDescription,
    this.categoryStatus,
  });

  Category copyWith({
    int? categoryID,
    String? categoryName,
    String? categoryDescription,
    bool? categoryStatus,
  }) {
    return Category(
      categoryID: categoryID ?? this.categoryID,
      categoryName: categoryName ?? this.categoryName,
      categoryDescription: categoryDescription ?? this.categoryDescription,
      categoryStatus: categoryStatus ?? this.categoryStatus,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryID': categoryID,
      'categoryName': categoryName,
      'categoryDescription': categoryDescription,
      'categoryStatus': categoryStatus,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryID: json['categoryID'] as int?,
      categoryName: json['categoryName'] as String?,
      categoryDescription: json['categoryDescription'] as String?,
      categoryStatus: json['categoryStatus'] as bool?,
    );
  }

  @override
  String toString() =>
      "Category(categoryID: $categoryID,categoryName: $categoryName,categoryDescription: $categoryDescription,categoryStatus: $categoryStatus)";

  @override
  int get hashCode => Object.hash(
      categoryID, categoryName, categoryDescription, categoryStatus);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          categoryID == other.categoryID &&
          categoryName == other.categoryName &&
          categoryDescription == other.categoryDescription &&
          categoryStatus == other.categoryStatus;
}

class Writer {
  int? writerID;
  String? writerUserName;
  String? writerNameSurname;
  String? writerAbout;
  String? writerImage;
  String? writerMail;
  bool? writerStatus;
  int? userID;

  Writer({
    this.writerID,
    this.writerUserName,
    this.writerNameSurname,
    this.writerAbout,
    this.writerImage,
    this.writerMail,
    this.writerStatus,
    this.userID,
  });

  Writer copyWith({
    int? writerID,
    String? writerUserName,
    String? writerNameSurname,
    String? writerAbout,
    String? writerImage,
    String? writerMail,
    bool? writerStatus,
    int? userID,
  }) {
    return Writer(
      writerID: writerID ?? this.writerID,
      writerUserName: writerUserName ?? this.writerUserName,
      writerNameSurname: writerNameSurname ?? this.writerNameSurname,
      writerAbout: writerAbout ?? this.writerAbout,
      writerImage: writerImage ?? this.writerImage,
      writerMail: writerMail ?? this.writerMail,
      writerStatus: writerStatus ?? this.writerStatus,
      userID: userID ?? this.userID,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'writerID': writerID,
      'writerUserName': writerUserName,
      'writerNameSurname': writerNameSurname,
      'writerAbout': writerAbout,
      'writerImage': writerImage,
      'writerMail': writerMail,
      'writerStatus': writerStatus,
      'userID': userID,
    };
  }

  factory Writer.fromJson(Map<String, dynamic> json) {
    return Writer(
      writerID: json['writerID'] as int?,
      writerUserName: json['writerUserName'] as String?,
      writerNameSurname: json['writerNameSurname'] as String?,
      writerAbout: json['writerAbout'] as String?,
      writerImage: json['writerImage'] as String?,
      writerMail: json['writerMail'] as String?,
      writerStatus: json['writerStatus'] as bool?,
      userID: json['userID'] as int?,
    );
  }

  @override
  String toString() =>
      "Writer(writerID: $writerID,writerUserName: $writerUserName,writerNameSurname: $writerNameSurname,writerAbout: $writerAbout,writerImage: $writerImage,writerMail: $writerMail,writerStatus: $writerStatus,userID: $userID)";

  @override
  int get hashCode => Object.hash(writerID, writerUserName, writerNameSurname,
      writerAbout, writerImage, writerMail, writerStatus, userID);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Writer &&
          runtimeType == other.runtimeType &&
          writerID == other.writerID &&
          writerUserName == other.writerUserName &&
          writerNameSurname == other.writerNameSurname &&
          writerAbout == other.writerAbout &&
          writerImage == other.writerImage &&
          writerMail == other.writerMail &&
          writerStatus == other.writerStatus &&
          userID == other.userID;
}
