//https://pub.dev/packages/react

var aDiv = div({ "className": "something" }, [
  h1({"style": {"height": "20px"}}, "Headline"),
  a({"href":"something.com"}, "Something"),
  "Some text"
]);

var aButton = button({ "onClick": (SyntheticMouseEvent event) => print(event)});


