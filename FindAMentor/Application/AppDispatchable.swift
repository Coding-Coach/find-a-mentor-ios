import Foundation
import Katana

// These typealias will simplify the writing of state updaters and side effects

protocol AppStateUpdater: StateUpdater where StateType == AppState {}
protocol AppSideEffect: SideEffect where StateType == AppState, Dependencies == DependenciesContainer {}
