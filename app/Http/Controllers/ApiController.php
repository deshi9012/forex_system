<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Symfony\Component\HttpFoundation\Response;

class ApiController extends BaseController {
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $statusCode = 200;
    protected $responseData = [];

    /**
     * @return mixed
     */
    public function getStatusCode() {
        return $this->statusCode;
    }

    public function setResponseData($responseData) {
        $this->responseData = $responseData;
        return $this;
    }

    public function getResponseData() {
        return $this->responseData;
    }

    /**
     * @param mixed $statusCode
     *
     * @return $this
     */
    public function setStatusCode($statusCode) {
        $this->statusCode = $statusCode;
        return $this;
    }

    /**
     * @param string $message
     *
     * @return mixed
     */

    public function respondCreated($message = "Resource Created") {
        return $this->setStatusCode(Response::HTTP_CREATED)->respondWithSuccess($message);
    }

    public function respondNotFound($message = "Resource not found") {
        return $this->setStatusCode(Response::HTTP_NOT_FOUND)->respondWithError($message);
    }
    public function respondUnprocessableEntity($message = "Unprocessable Entity") {
        return $this->setStatusCode(Response::HTTP_UNPROCESSABLE_ENTITY)->respondWithError($message);
    }

    public function respondInternalError($message = "Internal Error") {
        return $this->setStatusCode(Response::HTTP_INTERNAL_SERVER_ERROR)->respondWithError($message);
    }

    public function respondForbidden($message = "Forbidden") {
        return $this->setStatusCode(Response::HTTP_FORBIDDEN)->respondWithError($message);
    }

    /**
     * @param string $message
     *
     * @return mixed
     */
    public function respondWithError($message = "Error") {
        return $this->respond(['error' => ['message' => $message, 'status_code' => $this->getStatusCode()]]);
    }

    public function respondWithSuccess($message = "Success") {
        return $this->respond(['success' => ['message' => $message, 'status_code' => $this->getStatusCode(), 'data' => $this->getResponseData(),]]);
    }

    /**
     * @param $data
     * @param array $headers
     *
     * @return mixed
     */
    public function respond($data, $headers = []) {
        return response()->json($data, $this->getStatusCode(), $headers);
    }


    /**
     * TODO: Add some security
     */

    public function parseRequestFields($request) {
        $requestString = $request->query('fields');
        $requestString = str_replace(' ', '', $requestString);
        $requestArray = explode(",", $requestString);

        return $requestArray;
    }

    /**
     * @param $model
     * @param $request
     *
     * @return mixed
     *
     * This search can be implemented within every controller with the following one-liner:
     *
     * return parent::search(new Permission(), $request);
     *
     * Keep in mind that it is not very flexible at the moment. You can use it as example.
     */

    public function search($model, $request, $returnFields = []) {

        if ($model instanceof Model && in_array('Sofa\Eloquence\Eloquence', class_uses($model))) {
            if ($model->getSearchableColumns()) {

                $term = trim($request->q);

                if (empty($term)) {
                    return $this->respond([]);
                }

                $items = $model::search($term)->limit(5)->get();

                $formatted_tags = [];

                foreach ($items as $item) {
                    $data = [];
                    foreach ($returnFields as $field) {
                        $data[$field] = $item->$field;
                    }

                    $formatted_tags[] = ['id' => $item->id, 'data' => $data];
                }

                return $this->respond($formatted_tags);

            }
        }

        return $this->respondForbidden();
    }

}