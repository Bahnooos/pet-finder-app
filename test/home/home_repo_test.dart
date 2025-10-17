import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/features/home/data/models/pet_models.dart';
import 'package:pet_finder_app/features/home/data/repos/home_repo.dart';
import 'package:pet_finder_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/logic/cubit/home_state.dart';

class MockAPiService extends Mock implements ApiService {}

void main() {
  late MockAPiService mockClient;
  late HomeRepo homeRepo;
  final petsModelMock = [
    PetModels(
      id: '1',
      description: 'new cat',
      hypoallergenic: 1,
      image: PetImage(height: 100, width: 100, id: '1', url: 'fake'),
      name: 'any',
      origin: 'egyptian',
      referenceImageId: '1',
      wikipediaUrl: 'fakeurl',
    ),
  ];
  setUp(() {
    mockClient = MockAPiService();
    homeRepo = HomeRepo(mockClient);
  });
  group(' Home Repo Test -', () {
    test(
      'give repo class when get Pets method called the item then return the items',
      () async {
        // Arrange: Define the mock response

        when(
          () => mockClient.getPets(any(), any()),
        ).thenAnswer((_) async => petsModelMock);

        // Act: Call the method under test
        final pets = await homeRepo.getPets(page: 0, limit: 10);

        // Assert: Check the outcome
        expect(pets, isA<Success<List<PetModels>>>());
        pets.when(
          success: (data) {
            expect(data, isA<List<PetModels>>());
            expect(data, isNotEmpty);
            expect(data.first.id, '1');
          },
          failure: (_) => fail('Expected success, but got failure'),
        );
      },
    );

    test(
      'should return ApiResult.failure when ApiService call throws an exception',
      () async {
        // Arange: define mock response
        final exception = Exception('error');
        when(
          () => mockClient.getPets(any(), any()),
        ).thenThrow((_) async => exception);

        // Act : call the method under test
        final error = await homeRepo.getPets(page: 0, limit: 10);
        expect(error, isA<Failure<List<PetModels>>>());
        verify(() => mockClient.getPets(0, 10)).called(1);
        verifyNoMoreInteractions(mockClient);
      },
    );
  });

  group('Home Cubit -', () {
    blocTest<HomeCubit, HomeState>(
      'emits [MyState] when MyEvent is added.',
    
      build: () => HomeCubit(homeRepo),
      act: (cubit) => cubit.emitHomeStates(),
      expect: () => [isA<HomeLoading>(), isA<HomeSuccess>()],
    );
  });
}
