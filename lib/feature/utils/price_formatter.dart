class PriceFormatter {
  double? price;

  PriceFormatter({required this.price});

  formatPrice() {
    String? formattedPrice = price?.toStringAsFixed(0).replaceAllMapped(
        RegExp(r"(\d)(?=(\d{3})+(?!\d))"), (match) => "${match.group(0)} ");
    return formattedPrice;
  }
}
