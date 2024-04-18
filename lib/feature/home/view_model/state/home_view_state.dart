import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class HomeViewState extends Equatable {
  const HomeViewState({
    required this.isLoading,
    this.blogs,
  });

  final bool isLoading;
  final List<Blog>? blogs;

  @override
  List<Object?> get props => [isLoading];

  HomeViewState copyWith({bool? isLoading, List<Blog>? blogs}) {
    return HomeViewState(
      isLoading: isLoading ?? this.isLoading,
      blogs: blogs ?? this.blogs,
    );
  }
}
