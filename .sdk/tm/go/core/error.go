package core

type DexpaprikaError struct {
	IsDexpaprikaError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewDexpaprikaError(code string, msg string, ctx *Context) *DexpaprikaError {
	return &DexpaprikaError{
		IsDexpaprikaError: true,
		Sdk:              "Dexpaprika",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *DexpaprikaError) Error() string {
	return e.Msg
}
