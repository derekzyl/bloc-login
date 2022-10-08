abstract class FormSubmitStatus {
  const FormSubmitStatus();
}

class InitialFormStatus extends FormSubmitStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmitStatus {}

class SubmissionSuccess extends FormSubmitStatus {}

class SubmissionFailed extends FormSubmitStatus {
  final Object exception;

  SubmissionFailed(this.exception);
}
