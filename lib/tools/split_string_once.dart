extension StringSplitOnce on String {
  List<String> splitOnce(String delimiter, [ bool includeDelimiter = false, ]) =>
    switch (indexOf(delimiter)) {
      <0 => [ this, ],
      final idx => [
        substring(0, idx),
        substring(
          includeDelimiter
            ? idx
            : idx + 1,
        ),
      ],
    };
}
