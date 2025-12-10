class AboutUsModel {
  final String? title;
  final String? description;
  final String? wwrHeading;
  final String? wwrDescription;
  final String? hhTitle;
  final String? hhDesc;
  final String? ethicalBreedingHeading;
  final String? ethicalBreedingDescription;
  final String? deliverTitle;
  final String? deliverDesc;
  final String? image1;
  final String? image2;

  AboutUsModel({
    this.title,
    this.description,
    this.wwrHeading,
    this.wwrDescription,
    this.hhTitle,
    this.hhDesc,
    this.ethicalBreedingHeading,
    this.ethicalBreedingDescription,
    this.deliverTitle,
    this.deliverDesc,
    this.image1,
    this.image2,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      title: json['title'],
      description: json['description'],
      wwrHeading: json['wwr_heading'],
      wwrDescription: json['wwr_description'],
      hhTitle: json['h&h_title'],
      hhDesc: json['h&h_desc'],
      ethicalBreedingHeading: json['ethical_breading_heading'],
      ethicalBreedingDescription: json['ethical_breading_description'],
      deliverTitle: json['diliver_title'],
      deliverDesc: json['diliver_desc'],
      image1: json['image_1'],
      image2: json['image_2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'wwr_heading': wwrHeading,
      'wwr_description': wwrDescription,
      'h&h_title': hhTitle,
      'h&h_desc': hhDesc,
      'ethical_breading_heading': ethicalBreedingHeading,
      'ethical_breading_description': ethicalBreedingDescription,
      'diliver_title': deliverTitle,
      'diliver_desc': deliverDesc,
      'image_1': image1,
      'image_2': image2,
    };
  }
}
