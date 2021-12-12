<?php

namespace App\Controller;

use App\Repository\PostRepository;
use Exception;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\AbstractFOSRestController;
use FOS\RestBundle\Controller\Annotations as Rest;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Response;
use OpenApi\Annotations as OA;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/api/posts", name="api_posts")
 */
class PostController extends AbstractFOSRestController
{
    protected $postRepository;

    public function __construct(
        PostRepository $postRepository
    )
    {
        $this->postRepository = $postRepository;
    }

    /**
     * @Rest\Get("/")
     * 
     * @OA\Get(
     *      tags={"Post"},
     *      summary="Gets posts",
     *      @OA\Parameter(
     *          name="page",
     *          in="query",
     *          @OA\Schema(type="int"),
     *      ),
     *      @OA\Parameter(
     *          name="limit",
     *          in="query",
     *          @OA\Schema(type="int"),
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Returns status and result",
     *      ),
     *      @OA\Response(
     *          response=400,
     *          description="Returns status and error message",
     *     )
     * )
     *
     * @return Response
     */
    public function getPosts(Request $request, PaginatorInterface $paginator): Response
    {
        try {
            $query = $this->postRepository->findBy(['isDeleted' => false], ['createdAt' => 'DESC']);

            $result = $paginator->paginate(
                $query, 
                $request->query->getInt('page', 1), 
                $request->query->getInt('limit', 5)
            );

            $response = [
                'success' => true,
                'result' => [
                    'current_page_number' => $result->getCurrentPageNumber(),
                    'num_items_per_page' => $result->getItemNumberPerPage(),
                    'total_count' => $result->getTotalItemCount(),
                    'items' => $result->getItems()
                ],
                
            ];
        } catch (Exception $exception) {
            $response = [
                'success' => false,
                'message' => $exception->getMessage(),
            ];
        }
        
        return $this->handleView($this->view($response));
    }

}
