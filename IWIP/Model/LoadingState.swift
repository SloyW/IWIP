enum LoadingState {
    case Loading
    case Error(errorKey: String)
    case Empty
    case Loaded
}
