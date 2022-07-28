enum Attribute {
  hotAndNew,
  requestAQuote,
  waitlistReservation,
  deals,
  genderNeutralRestrooms,
  openToAll,
  wheelchairAccessible,
}

const attributes = <Attribute, String>{
  Attribute.hotAndNew: "hot_and_new",
  Attribute.requestAQuote: "request_a_quote",
  Attribute.waitlistReservation: "waitlist_reservation",
  Attribute.deals: "deals",
  Attribute.genderNeutralRestrooms: "gender_neutral_restrooms",
  Attribute.openToAll: "open_to_all",
  Attribute.wheelchairAccessible: "wheelchair_accessible",
};
