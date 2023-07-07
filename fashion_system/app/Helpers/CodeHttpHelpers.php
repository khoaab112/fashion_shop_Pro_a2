<?php

namespace App\Helpers;

use Symfony\Component\HttpFoundation\Response;

class CodeHttpHelpers
{
  //fun return code http response to client
  public static function returnCode(int $code)
  {

    return match ($code) {
      100 => Response::HTTP_CONTINUE,
      101 => Response::HTTP_SWITCHING_PROTOCOLS,
      200 => Response::HTTP_OK,
      201 => Response::HTTP_CREATED,
      202 => Response::HTTP_ACCEPTED,
      203 => Response::HTTP_NON_AUTHORITATIVE_INFORMATION,
      204 => Response::HTTP_NO_CONTENT,
      205 => Response::HTTP_RESET_CONTENT,
      206 => Response::HTTP_PARTIAL_CONTENT,
      300 => Response::HTTP_MULTIPLE_CHOICES,
      301 => Response::HTTP_MOVED_PERMANENTLY,
      302 => Response::HTTP_FOUND,
      303 => Response::HTTP_SEE_OTHER,
      304 => Response::HTTP_NOT_MODIFIED,
      305 => Response::HTTP_USE_PROXY,
      307 => Response::HTTP_TEMPORARY_REDIRECT,
      308 => Response::HTTP_PERMANENTLY_REDIRECT,
      400 => Response::HTTP_BAD_REQUEST,
      401 => Response::HTTP_UNAUTHORIZED,
      402 => Response::HTTP_PAYMENT_REQUIRED,
      403 => Response::HTTP_FORBIDDEN,
      404 => Response::HTTP_NOT_FOUND,
      405 => Response::HTTP_METHOD_NOT_ALLOWED,
      406 => Response::HTTP_NOT_ACCEPTABLE,
      407 => Response::HTTP_PROXY_AUTHENTICATION_REQUIRED,
      408 => Response::HTTP_REQUEST_TIMEOUT,
      409 => Response::HTTP_CONFLICT,
      410 => Response::HTTP_GONE,
      411 => Response::HTTP_LENGTH_REQUIRED,
      412 => Response::HTTP_PRECONDITION_FAILED,
      //   413 => Response::HTTP_PAYLOAD_TOO_LARGE,
      414 => Response::HTTP_REQUEST_URI_TOO_LONG,
      415 => Response::HTTP_UNSUPPORTED_MEDIA_TYPE,
      416 => Response::HTTP_REQUESTED_RANGE_NOT_SATISFIABLE,
      417 => Response::HTTP_EXPECTATION_FAILED,
      422 => Response::HTTP_UNPROCESSABLE_ENTITY,
      429 => Response::HTTP_TOO_MANY_REQUESTS,
      500 => Response::HTTP_INTERNAL_SERVER_ERROR,
      501 => Response::HTTP_NOT_IMPLEMENTED,
      502 => Response::HTTP_BAD_GATEWAY,
      503 => Response::HTTP_SERVICE_UNAVAILABLE,
      504 => Response::HTTP_GATEWAY_TIMEOUT,
      505 => Response::HTTP_VERSION_NOT_SUPPORTED,
      default => Response::HTTP_BAD_REQUEST,
    };
  }
  //function return response to client
  public static function returnJson(int $resultCode, bool $status, $results, int $codeHttp)
  {
    return response()->json(
        ['result_code' => $resultCode, 'status' => $status ? 'success' : 'error', 'results' => $results],
        self::returnCode($codeHttp)
      );
  }
}
