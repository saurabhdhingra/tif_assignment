// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
    Event({
        required this.id,
        required this.title,
        required this.description,
        required this.bannerImage,
        required this.dateTime,
        required this.organiserName,
        required this.organiserIcon,
        required this.venueName,
        required this.venueCity,
        required this.venueCountry,
    });

    int id;
    String title;
    String description;
    String bannerImage;
    DateTime dateTime;
    String organiserName;
    String organiserIcon;
    String venueName;
    String venueCity;
    String venueCountry;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        bannerImage: json["banner_image"],
        dateTime: DateTime.parse(json["date_time"]),
        organiserName: json["organiser_name"],
        organiserIcon: json["organiser_icon"],
        venueName: json["venue_name"],
        venueCity: json["venue_city"],
        venueCountry: json["venue_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "banner_image": bannerImage,
        "date_time": dateTime.toIso8601String(),
        "organiser_name": organiserName,
        "organiser_icon": organiserIcon,
        "venue_name": venueName,
        "venue_city": venueCity,
        "venue_country": venueCountry,
    };
}
